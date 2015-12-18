//
//  Constants.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import Foundation
import UIKit

// MARK: UI: -

// MARK: typealias
typealias Grid = [[TileView]]
typealias GridSize = (width: Int, height: Int)


// MARK: constants
let TILE_WIDTH = 40
let TILE_HEIGHT = TILE_WIDTH

let TILE_MARGIN = 1

// MARK: structs
enum Color {
  static let margin = UIColor.blackColor()
  static let activeTile = UIColor.greenColor()
  static let inactiveTile = UIColor.whiteColor()
}

// MARK: - Logic: -

// MARK: typealias

// MARK: enums

enum Condition
{
  case location
  case resetAll
}

// MARK: structs
struct Coordinate
{
  var x : Int
  var y : Int
}
