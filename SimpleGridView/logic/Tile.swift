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
  
  var types = Category.new
  
  mutating func setActive()
  {
    types = Category.active
  }
  
  mutating func reset()
  {
    types = Category.new
  }
}