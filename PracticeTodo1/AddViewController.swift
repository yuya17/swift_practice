//
//  AddViewController.swift
//  PracticeTodo1
//
//  Created by 野崎祐矢 on 2018/05/25.
//  Copyright © 2018年 野崎祐矢. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        
        //現在の配列の状況を取り出す
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            array = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        array.append(textField.text!)

        UserDefaults.standard.set(array, forKey: "array")
    
        self.navigationController?.popViewController(animated: true)
        
   
    }


}
