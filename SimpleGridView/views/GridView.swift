//
//  GridView.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

public class GridView : UIView
{
  // MARK: - Fields
  private var grid: Grid = []
  private var size: GridSize
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
        case .setAll:
          toggleTileState(tile, state: state)
        case .location:
          if let point = value as! CGPoint?
          {
            setTileIfPoint(tile, point: point, state: state)
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
    case .active:
      tile.setActive()
    }
  }
  
  // MARK: - Touches methods
  override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    if shouldResetGrid((event?.allTouches()?.count)!)
    {
      traverseGrid(Tile.State.new, condition: Condition.setAll, value: nil)
    } else
    {
      for touch in touches
      {
        setViewIfTile(touch.view!, state: Tile.State.active)
      }
    }
  }
  
  override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    for touch in touches
    {
      let location = touch.locationInView(self)
      traverseGrid(Tile.State.active, condition: Condition.location, value: location)
    }
  }
  
  override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    
  }
  
  override public func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?)
  {
    
  }
  
  // MARK: Helper methods
  
  func setTileIfPoint(tile: TileView, point: CGPoint, state: Tile.State)
  {
    if tile.containsPoint(point)
    {
      toggleTileState(tile, state: state)
    }
  }
  
  func setViewIfTile(view: UIView, state: Tile.State)
  {
    if isTileView(view)
    {
      let tile = view as! TileView
      toggleTileState(tile, state: state)
    }
  }
  
  func shouldResetGrid(count: Int) -> Bool
  {
    return count > 1
  }
  
  func isTileView(view: UIView) -> Bool
  {
    return view.isKindOfClass(TileView)
  }
  
  required public init?(coder aDecoder: NSCoder)
  {
    fatalError("init(coder:) has not been implemented")
  }
  
}
