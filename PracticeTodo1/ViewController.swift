//
//  ViewController.swift
//  PracticeTodo1
//
//  Created by 野崎祐矢 on 2018/05/24.
//  Copyright © 2018年 野崎祐矢. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //アプリ内にarrayというキー値で保存された、配列arrayを取り出す
        
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            resultArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //動的に処理する
        return resultArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セル関連
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            //配列のセルのスライドされた番号の消去
            
            resultArray.remove(at: indexPath.row)
            
            //その配列を再びアプリ内保存
            
            UserDefaults.standard.set(resultArray, forKey: "array")
            
            //tableVIewを更新
            tableView.reloadData()
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



