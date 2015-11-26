//
//  TileView.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

class TileView : UIView {
  var tile : Tile?
  
  // functions for changing color/state and for handling touch
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.whiteColor()
    //userInteractionEnabled = false
    //multipleTouchEnabled = true
    //exclusiveTouch = false
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func changePosition(x: Int, y: Int)
  {
    frame.origin.x = CGFloat(x)
    frame.origin.y = CGFloat(y)
  }
  
  func setActive()
  {
    backgroundColor = UIColor.greenColor()
  }
  
  func reset()
  {
    backgroundColor = UIColor.whiteColor()
  }
}
