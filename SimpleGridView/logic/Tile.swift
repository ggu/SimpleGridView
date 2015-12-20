//
//  Tile.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation

struct Tile
{
  enum Category
  {
    case new
    case active
  }
  
  var type = Category.new
  
  mutating func setActive()
  {
    type = Category.active
  }
  
  mutating func reset()
  {
    type = Category.new
  }
}