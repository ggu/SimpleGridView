//
//  Tile.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation

class Tile {
  
  var type : Type?
  var coordinate : Coordinate?
  
  init(tileType: Type, tileCoord: Coordinate?)
  {
    type = tileType
    coordinate = tileCoord
  }
}