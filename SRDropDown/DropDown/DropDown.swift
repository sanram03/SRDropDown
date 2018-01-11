//
//  DropDown.swift
//  SimpleTestApp
//
//  Created by Rim global on 29/12/17.
//  Copyright © 2017 Rim global. All rights reserved.
// Hello

import UIKit

protocol DropDownDelegate {
    func didSelectValue(val:String)
}

@IBDesignable class DropDown: UIView {
    
    var dropView : UITableView = {
       let droppingView = UITableView()
        droppingView.backgroundColor = UIColor.red
        droppingView.layer.cornerRadius = 10
        return droppingView
    }()
    
    var selectedInfo : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    var delegate : DropDownDelegate?
    
    var isExpended : Bool = true
    var dataList = [String]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init frame")
        
        setUpGesture()
        initializeSetUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init decoder")
        setUpGesture()
        initializeSetUp()
    }
    
    func initializeSetUp()
    {
        dropView.delegate = self
        dropView.dataSource = self
        dropView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func setUpGesture()
    {
        selectedInfo.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        addSubview(selectedInfo)
        
        dropView.frame = .zero
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func tapped()
   {
    print("its tapped")
    
        if isExpended
        {
            print("inside if")
            self.dropView.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + self.bounds.height + 10, width: self.bounds.width, height: 100)
//            UIView.animate(withDuration: 1.0, delay: 0, options: .transitionFlipFromLeft, animations: {
//                ()-> Void in
                self.isExpended = false
                print("x is \(self.frame.origin.x) y is \(self.frame.origin.y)")
//                self.dropView.bounds.size.width = self.bounds.width
                self.superview?.addSubview(self.dropView)
//            }, completion: nil)
            
            
        }else{
            
//            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseIn, animations: {
//                ()-> Void in
                print("inside else")
                self.isExpended = true
                self.dropView.frame = .zero
                self.dropView.removeFromSuperview()
//            }, completion: nil)
            
            
            
            
            
        }
    }
    
    
}

extension DropDown: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected is \(dataList[indexPath.row])")
        selectedInfo.text = dataList[indexPath.row]
        self.isExpended = true
        self.dropView.frame = .zero
        self.dropView.removeFromSuperview()
        guard let delegator = delegate else
        {
            return
        }
        delegator.didSelectValue(val: dataList[indexPath.row])
        
    }
}


