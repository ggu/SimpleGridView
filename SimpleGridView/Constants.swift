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
typealias SKGrid = [[TileNode]]
typealias GridSize = (width: Int, height: Int)

// MARK: constant

// MARK: enum

enum Color {
  static let margin = UIColor.blackColor()
  static let activeTile = UIColor.greenColor()
  static let inactiveTile = UIColor.whiteColor()
}

// MARK: - Logic: -

// MARK: typealias

// MARK: constant

// MARK: enum

enum Condition {
  case location
  case setAll
}