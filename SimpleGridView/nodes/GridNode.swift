//
//  GridNode.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 1/9/16.
//

import SpriteKit

public class GridNode: SKSpriteNode
{
  // MARK: - Fields
  private var grid: SKGrid = []
  // MARK: -
  
  init(size: CGSize)
  {
    super.init(texture: nil, color: Color.margin, size: size)
    
    setup()
  }
  
  private func setup()
  {
    //createGrid()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}