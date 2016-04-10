//
//  GridScene.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 1/17/16.
//

import SpriteKit

class GridScene: SKScene {
  
  private var gridNode = GridNode()
  
  internal override init(size: CGSize) {
    super.init(size: size)
  }
  
  internal override func didMoveToView(view: SKView) {
    setup()
  }
  
  private func setup() {
    gridNode.position = CGPointZero
    gridNode.anchorPoint = CGPointZero
    gridNode.createGrid(size)
    addChild(gridNode)
  }
  
  internal override func update(currentTime: CFTimeInterval) {
    
  }
  
  internal required init?(coder aDecoder: NSCoder) {    
    super.init(coder: aDecoder)
  }
}
