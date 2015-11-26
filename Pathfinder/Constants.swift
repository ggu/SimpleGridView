//
//  Constants.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//  Copyright © 2015 Five Three. All rights reserved.
//

import Foundation

// MARK: UI: -

// MARK: typealias
typealias Grid = [[TileView]]
typealias GridSize = (width: Int, height: Int)


// MARK: constants
let TILE_WIDTH = 40
let TILE_HEIGHT = TILE_WIDTH
let TILE_MARGIN = 1

// MARK: struct
//struct GridSize
//{
//  let width : Int?
//  let height : Int?
//}

// MARK: Logic: -

// MARK: typealias
typealias Matrix = [[Coordinate]]

// MARK: enum
enum Type
{
  case new
  case obstacle
  case start
  case target
}

// MARK: struct
struct Coordinate
{
  var x : Int
  var y : Int
}

struct MatrixSize
{
  let x : Int?
  let y : Int?
}

