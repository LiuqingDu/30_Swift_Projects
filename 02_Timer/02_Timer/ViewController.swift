//
//  ViewController.swift
//  02_Timer
//
//  Created by 杜流清 on 30/01/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var result_Label: UILabel!
    var start_Btn: UIButton!
    var stop_Btn: UIButton!
    var timer: Timer!
    var resutl: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        result_Label = UILabel()
        self.view.addSubview(result_Label)
        result_Label.textColor = UIColor.black
        result_Label.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(self.view.snp.centerX).offset(50)
            make.top.equalTo(100)
        }
        result_Label.font = UIFont.systemFont(ofSize: 30)
        result_Label.text = "0"
        
        start_Btn = UIButton(type: .system)
        self.view.addSubview(start_Btn)
        start_Btn.setTitle("Start", for: .normal)
        start_Btn.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerX.equalTo(self.view.frame.width*0.75)
            make.centerY.equalTo(self.view.frame.height*0.75)
        }
        start_Btn.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        
        let reset_Btn = UIButton(type: .system)
        self.view.addSubview(reset_Btn)
        reset_Btn.setTitle("Reset", for: .normal)
        reset_Btn.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerX.equalTo(self.view.frame.width*0.25)
            make.centerY.equalTo(self.view.frame.height*0.75)
        }
        reset_Btn.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
        
        stop_Btn = UIButton(type: .system)
        self.view.addSubview(stop_Btn)
        stop_Btn.setTitle("Stop", for: .normal)
        stop_Btn.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerX.equalTo(self.view.frame.width*0.75)
            make.centerY.equalTo(self.view.frame.height*0.75)
        }
        stop_Btn.addTarget(self, action: #selector(stopHandler), for: .touchUpInside)
        stop_Btn.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startHandler(sender: UIButton) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            self.resutl = self.resutl + 0.1
            self.result_Label.text = String(format: "%.1f", self.resutl)
        }
        sender.isHidden = true
        self.stop_Btn.isHidden = false
        self.timer.fire()
        
    }

    @objc func stopHandler(sender: UIButton) {
        guard let t = self.timer
            else {return}
        t.invalidate()
        sender.isHidden = true
        self.start_Btn.isHidden = false
    }
    
    @objc func resetHandler() {
        self.result_Label.text = "0"
        self.resutl = 0
    }
}

