//
//  TileView.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

class TileView : UIView
{
  var tile : Tile?
    
  override init(frame: CGRect)
  {
    super.init(frame: frame)
    backgroundColor = Color.inactiveTile
    tile = Tile()
  }
  
  func setActive()
  {
    backgroundColor = Color.activeTile
    tile?.setActive()
  }
  
  func reset()
  {
    backgroundColor = Color.inactiveTile
    tile?.setInactive()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
