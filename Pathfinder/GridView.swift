//
//  GridView.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

class GridView : UIView
{
  var grid : Grid = []
  var size : GridSize?
  
  init(gridSize: CGSize)
  {
    size = (Int(gridSize.width), Int(gridSize.height))
    let frame = CGRectMake(0, 0, gridSize.width, gridSize.height)
    super.init(frame: frame)
    backgroundColor = UIColor.blackColor()
    createGrid()
    multipleTouchEnabled = true
  }
  
  func createGrid()
  {
    var xPos = 0
    var yPos = 0
    for x in 0..<(size!.width)/(TILE_WIDTH) {
      grid.append([])
      for _ in 0..<(size!.height)/(TILE_HEIGHT) {
        let tile = TileView(frame: CGRectMake(CGFloat(xPos), CGFloat(yPos), CGFloat(TILE_WIDTH), CGFloat(TILE_HEIGHT)))
        addSubview(tile)
        grid[x].append(tile)
        //yPos += TILE_HEIGHT
        yPos += TILE_HEIGHT + TILE_MARGIN
      }
      yPos = 0
      //xPos += TILE_WIDTH
      xPos += TILE_WIDTH + TILE_MARGIN
    }
  }

  func resetGrid()
  {
    for tile in subviews as! [TileView]
    {
      tile.reset()
    }
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if event?.allTouches()!.count > 1
    {
      resetGrid()
    } else {
      for touch in touches
      {
        if (touch.view!.isKindOfClass(TileView))
        {
          let view = touch.view as! TileView
          view.setActive()
        }
        
      }
    }
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches
    {
      //print("hello \(touch.)")
      let location = touch.locationInView(self)
      for tile in subviews as! [TileView]
      {
        if (CGRectContainsPoint(tile.frame, location))
        {
          tile.setActive()
        }
      }
      
    }
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//    for touch in touches
//    {
//      let view = touch.view as! TileView
//      view.setActive()
//    }
  }
  
  override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
  }


  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}