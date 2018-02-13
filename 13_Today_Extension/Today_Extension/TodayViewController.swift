//
//  TodayViewController.swift
//  Today_Extension
//
//  Created by Liuqing Du on 13/02/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var currentTime: UILabel!
    var timer: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        currentTime = UILabel();
        self.view.addSubview(currentTime)
        currentTime.textColor = UIColor.black
        currentTime.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        currentTime.font = UIFont.systemFont(ofSize: 30)
        
        let userDefaults = UserDefaults(suiteName: "group.liuqingdu.todayExtension")
        var leftTimeWhenQuit = userDefaults?.double(forKey: "lefttime")
        
        currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            leftTimeWhenQuit = leftTimeWhenQuit! + 0.1
            
            self.currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        }
        self.timer.fire()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
