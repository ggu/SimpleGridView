//
//  ViewController.swift
//  SimpleGridView
//
//  Created by Gabriel Uribe on 11/25/15.
//

import UIKit

internal class ViewController: UIViewController {

  private var gridView : GridView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func setup()
  {
    gridView = GridView(size: view.frame.size)
    view.addSubview(gridView!)
  }
  
}
