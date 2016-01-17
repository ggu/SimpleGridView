//
//  SKViewController.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 1/17/16.
//

import UIKit
import SpriteKit

class SKViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure the view.
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = true
    
    let scene = GridScene(size: skView.bounds.size)
    
    /* Set the scale mode to scale to fit the window */
    scene.scaleMode = .AspectFill
    
    
    
    skView.presentScene(scene)
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return .AllButUpsideDown
    } else {
      return .All
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
}
