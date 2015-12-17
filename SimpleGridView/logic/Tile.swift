//
//  Tile.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation

struct Tile
{
  var type = TileType.new
  
  mutating func setActive()
  {
    type = TileType.active
  }
  
  mutating func setInactive()
  {
    type = TileType.new
  }
}