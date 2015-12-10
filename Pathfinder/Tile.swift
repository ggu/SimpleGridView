//
//  Tile.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation

class Tile {
  
  var type = TileType.new
  
  init()
  {
    
  }
  
  init(tileType: TileType)
  {
    type = tileType
  }
  
  func setActive()
  {
    type = TileType.active
  }
  
  func setInactive()
  {
    type = TileType.new
  }
}