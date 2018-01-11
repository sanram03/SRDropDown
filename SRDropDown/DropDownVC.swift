//
//  DropDownVC.swift
//  SimpleTestApp
//
//  Created by Rim global on 29/12/17.
//  Copyright © 2017 Rim global. All rights reserved.
//

import UIKit

class DropDownVC: UIViewController,DropDownDelegate {
    
     
    
    @IBOutlet weak var dropDown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dropDown.dataList = ["abc","pqr","lmn","xyz"]
        dropDown.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectValue(val: String) {
        print("selected val in vc \(val)")
    }
   
}
