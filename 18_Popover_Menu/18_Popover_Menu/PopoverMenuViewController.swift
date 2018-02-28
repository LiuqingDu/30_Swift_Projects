//
//  PopoverMenuViewController.swift
//  18_Popover_Menu
//
//  Created by Liuqing Du on 2018/2/28.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class PopoverMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [MenuItem] = [
        MenuItem(picture: "1", name: "发起群聊"),
        MenuItem(picture: "2", name: "添加朋友"),
        MenuItem(picture: "3", name: "扫一扫"),
        MenuItem(picture: "4", name: "收付款")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PopoverMenuTableViewCell
        
        cell.menuImage.image = UIImage(named: data[indexPath.row].picture)
        cell.menuName.setTitle(data[indexPath.row].name, for: UIControlState())
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
