//
//  GridView.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

class GridView : UIView
{
  // MARK: - Fields
  private var grid : Grid = []
  private var size : GridSize
  // MARK: -
  
  init(size: CGSize)
  {
    self.size = (Int(size.width), Int(size.height))
    let frame = CGRectMake(0, 0, size.width, size.height)
    
    super.init(frame: frame)
    
    setup()
  }
  
  private func setup()
  {
    backgroundColor = Color.margin
    createGrid()
  }
  
  // MARK: - Grid Methods
  private func createGrid()
  {
    var xPos = 0
    var yPos = 0
    
    // TODO: Extra space
    // Currently adding 1 to guarantee that there is no blank space on edge of grid
    // instead, center grid with border over blank space and/or add support for larger grids and panning
    for x in 0..<(size.width/(TILE_WIDTH + TILE_MARGIN) + 1)
    {
      grid.append([])
      for _ in 0..<(size.height/(TILE_HEIGHT + TILE_MARGIN) + 1)
      {
        let tileFrame = CGRectMake(CGFloat(xPos), CGFloat(yPos), CGFloat(TILE_WIDTH), CGFloat(TILE_HEIGHT))
        let tile = TileView(frame: tileFrame)
        
        addSubview(tile)
        grid[x].append(tile)
        
        yPos += TILE_HEIGHT + TILE_MARGIN
      }
      yPos = 0
      xPos += TILE_WIDTH + TILE_MARGIN
    }
  }
  
  private func traverseGrid(state: Tile.State, condition: Condition, value: Any?)
  {
    for x in grid
    {
      for tile in x
      {
        switch condition
        {
        case Condition.setAll:
          toggleTileState(tile, state: state)
        case Condition.location:
          if let point = value as! CGPoint?
          {
            if (tile.frame.contains(point))
            {
              toggleTileState(tile, state: state)
            }
          }
        }
      }
    }
  }
  
  // MARK: - Tile state methods
  private func toggleTileState(tile: TileView, state: Tile.State)
  {
    switch state
    {
    case .new:
      tile.reset()
      break
    case .active:
      tile.setActive()
      break
    }
  }
  
  // MARK: - Touches methods
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    let shouldReset = event?.allTouches()!.count > 1
    if shouldReset
    {
      traverseGrid(Tile.State.new, condition: Condition.setAll, value: nil)
    } else
    {
      for touch in touches
      {
        if touch.view!.isKindOfClass(TileView)
        {
          let tile = touch.view as! TileView
          toggleTileState(tile, state: Tile.State.active)
        }
      }
    }
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    for touch in touches
    {
      let location = touch.locationInView(self)
      traverseGrid(Tile.State.active, condition: Condition.location, value: location)
    }
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    
  }
  
  override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?)
  {
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}