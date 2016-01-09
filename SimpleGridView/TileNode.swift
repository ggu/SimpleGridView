//
//  TileNode.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 1/9/16.
//

import SpriteKit

var SK_TILE_WIDTH = 40
var SK_TILE_HEIGHT = 40
var SK_TILE_MARGIN = 1

internal class TileNode: SKSpriteNode
{
  private var tile : Tile
  
  init(size: CGSize, position: CGPoint)
  {
    tile = Tile()
    super.init(texture: nil, color: Color.inactiveTile, size: size)
    self.position = position
  }
  
  func setActive()
  {
    self.color = Color.activeTile
    tile.setActive()
  }
  
  func reset()
  {
    self.color = Color.inactiveTile
    tile.reset()
  }
  
  static func changeTileWidth(width: Int)
  {
    SK_TILE_WIDTH = width
  }
  
  static func changeTileHeight(height: Int)
  {
    SK_TILE_HEIGHT = height
  }
  
  static func changeTileMargin(margin: Int)
  {
    SK_TILE_MARGIN = margin
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}