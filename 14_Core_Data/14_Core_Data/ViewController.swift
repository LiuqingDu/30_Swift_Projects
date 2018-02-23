//
//  ViewController.swift
//  14_Core_Data
//
//  Created by Liuqing Du on 2018/2/23.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let table = UITableView()
    var dataSource = Array<Item>()
    let EntityName = "Item"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 设置顶部标题
        self.navigationItem.title = "待办事项"
        // 设置右上角添加按钮
        let rightBarItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addItem))
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        self.updateDataSource()
        self.table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.frame = self.view.frame
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    
    @objc func addItem() {
        let alertController = UIAlertController(title: "添加事项", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确认", style: .default) { (_) in
            guard let field: UITextField = alertController.textFields![0] else {return}
            self.saveContent(content: field.text!)
            self.updateDataSource()
            self.table.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入待办事项内容"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "coreDataReuseId")
        cell.textLabel?.text = dataSource[indexPath.row].title
        return cell
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveContent(content:String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        
        let item = NSManagedObject(entity: entity!, insertInto: context)
        
        item.setValue(content, forKey: "title")
        
        do {
            try context.save()
        }catch{
            print(error)
        }
    }
    
    func updateDataSource(){
        // 获取全部数据
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName)
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            dataSource = searchResults as! [Item]
        } catch  {
            print(error)
        }
    }
}

