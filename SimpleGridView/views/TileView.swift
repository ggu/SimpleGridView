//
//  TileView.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

var TILE_WIDTH = 40
var TILE_HEIGHT = 40
var TILE_MARGIN = 1

class TileView : UIView
{
  private var tile : Tile  
    
  override init(frame: CGRect)
  {
    tile = Tile()
    super.init(frame: frame)
    backgroundColor = Color.inactiveTile
  }
  
  func setActive()
  {
    backgroundColor = Color.activeTile
    tile.setActive()
  }
  
  func reset()
  {
    backgroundColor = Color.inactiveTile
    tile.reset()
  }
  
  func containsPoint(point: CGPoint) -> Bool
  {
    return frame.contains(point)
  }
  
  static func changeTileWidth(width: Int)
  {
    TILE_WIDTH = width
  }
  
  static func changeTileHeight(height: Int)
  {
    TILE_HEIGHT = height
  }
  
  static func changeTileMargin(margin: Int)
  {
    TILE_MARGIN = margin
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
