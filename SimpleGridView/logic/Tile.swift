//
//  Tile.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation

struct Tile
{
  enum State
  {
    case new
    case active
  }
  
  var state = State.new
  
  mutating func setActive()
  {
    state = .active
  }
  
  mutating func reset()
  {
    state = .new
  }
}