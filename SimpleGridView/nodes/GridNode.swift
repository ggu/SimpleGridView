//
//  GridNode.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 1/9/16.
//

import SpriteKit

public class GridNode: SKSpriteNode
{
  // MARK: - Fields
  private var grid: SKGrid = []
  
  // MARK: -
  
  init(size: CGSize)
  {
    super.init(texture: nil, color: Color.margin, size: size)
    self.userInteractionEnabled = true
    setup()
  }
  
  private func setup()
  {
    createGrid()
  }
  
  // MARK: - Grid Methods
  private func createGrid()
  {
    //var xPos = 0
    //var yPos = 0
    var position = CGPointMake(0, 0)
    let tileSize = CGSizeMake(CGFloat(SK_TILE_WIDTH), CGFloat(SK_TILE_HEIGHT))
    
    // TODO: Extra space
    // Currently adding 1 to guarantee that there is no blank space on edge of grid
    // instead, center grid with border over blank space and/or add support for larger grids and panning
    for x in 0..<(Int(size.width)/(SK_TILE_WIDTH + SK_TILE_MARGIN) + 1)
    {
      grid.append([])
      for _ in 0..<(Int(size.height)/(SK_TILE_HEIGHT + SK_TILE_MARGIN) + 1)
      {
        let tile = TileNode(size: tileSize, position: position)
        
        addChild(tile)
        grid[x].append(tile)
        
        position.y += CGFloat(TILE_HEIGHT + TILE_MARGIN)
      }
      position.y = 0
      position.x += CGFloat(TILE_WIDTH + TILE_MARGIN)
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
  private func toggleTileState(tile: TileNode, state: Tile.State)
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
        let location = touch.locationInNode(self)
        setNodeIfTile(nodeAtPoint(location), state: Tile.State.new)
      }
    }
  }
  
  override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
  {
    for touch in touches
    {
      let location = touch.locationInNode(self)
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
  
  func setTileIfPoint(tile: TileNode, point: CGPoint, state: Tile.State)
  {
    if tile.containsPoint(point)
    {
      toggleTileState(tile, state: state)
    }
  }
  
  func setNodeIfTile(node: SKNode, state: Tile.State)
  {
    if isTileNode(node)
    {
      let tile = node as! TileNode
      toggleTileState(tile, state: state)
    }
  }
  
  func shouldResetGrid(count: Int) -> Bool
  {
    return count > 1
  }
  
  func isTileNode(node: SKNode) -> Bool
  {
    return node.isKindOfClass(TileNode)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}