//
//  ViewController.swift
//  03_Pull_To_Refresh
//
//  Created by 杜流清 on 30/01/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table_View: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table_View = UITableView(frame: self.view.bounds)
        table_View.frame.origin.y = 44
        self.view.addSubview(table_View)
        table_View.delegate = self
        table_View.dataSource = self
        dataSource.append(Date())
        refresh.attributedTitle = NSAttributedString(string: "最后刷新时间：\(Date())")
        refresh.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        table_View.addSubview(refresh)
        table_View.reloadData()
        
    }
    
    @objc func pullRefresh() {
        dataSource.append(Date())
        refresh.endRefreshing()
        table_View.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr =  dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }

}

