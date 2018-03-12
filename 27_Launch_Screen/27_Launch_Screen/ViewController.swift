//
//  ViewController.swift
//  27_Launch_Screen
//
//  Created by Liuqing Du on 2018/3/12.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        LaunchScreenCountdownView.showLaunchScreenCountdownView(3, bgImage: UIImage(named: "Aurora"))
    }

}

