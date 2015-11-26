//
//  ViewController.swift
//  Pathfinder
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

class ViewController: UIViewController {

  var gridView : GridView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setup()
  {
    gridView = GridView(gridSize: view.frame.size)
    view.addSubview(gridView!)
//    let button = UIButton(frame: CGRectMake(100, 100, 100, 100))
//    button.titleLabel?.text = "RESET"
//    button.layer.zPosition = 1000000
//    view.addSubview(button)
  }


}

