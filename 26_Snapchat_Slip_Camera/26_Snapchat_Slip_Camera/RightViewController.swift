//
//  RightViewController.swift
//  26_Snapchat_Slip_Camera
//
//  Created by Liuqing Du on 2018/3/9.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightImage:UIImage = #imageLiteral(resourceName: "rightSnap")
        let rightImageView = UIImageView(frame: self.view.frame)
        rightImageView.image = rightImage
        self.view.addSubview(rightImageView)
        
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
