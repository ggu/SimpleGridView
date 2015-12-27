//
//  Coordinate.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 12/19/15.
//

import Foundation

struct Coordinate
{
  var x : Int
  var y : Int
  
  // Manhattan distance
  func mDistance(coordinate: Coordinate) -> Int
  {
    return abs(x - coordinate.x) + abs(y - coordinate.y)
  }
  
  // Diagonal distance
  func dDistance(coordinate: Coordinate) -> Int
  {
    return max(abs(x - coordinate.x), abs(y - coordinate.y))
  }
}