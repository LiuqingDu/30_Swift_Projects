//
//  ViewController.swift
//  13_Today_Extension
//
//  Created by Liuqing Du on 13/02/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result_Label: UILabel!
    var timer: Timer!
    var resutl: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        result_Label = UILabel()
        self.view.addSubview(result_Label)
        result_Label.textColor = UIColor.black
        result_Label.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
        result_Label.font = UIFont.systemFont(ofSize: 30)
        result_Label.text = "0.0"
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            self.resutl = self.resutl + 0.1
            self.result_Label.text = String(format: "%.1f", self.resutl)
        }
        self.timer.fire()
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func applicationWillResignActive() {
        if timer == nil {
            clearDefaults()
        } else {
            if timer.isValid {
                saveDefaults()
            } else {
                clearDefaults()
            }
        }
    }
    
    private func saveDefaults() {
        let userDefault = UserDefaults(suiteName: "group.liuqingdu.todayExtension")
        userDefault?.set(self.result_Label, forKey: "lefttime")
        userDefault?.synchronize()
    }
    
    private func clearDefaults() {
        let userDefault = UserDefaults(suiteName: "group.liuqingdu.todayExtension")
        userDefault?.removeObject(forKey: "lefttime")
        userDefault?.synchronize()
    }

}


