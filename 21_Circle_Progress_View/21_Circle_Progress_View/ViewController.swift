//
//  ViewController.swift
//  21_Circle_Progress_View
//
//  Created by Liuqing Du on 2018/3/4.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progerssView: ProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var currentProgress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressLabel.text = "\(currentProgress)%"
        
        addButton.layer.cornerRadius = 30
        minusButton.layer.cornerRadius = 30
        
    }
    
    @IBAction func addProgress(_ sender: AnyObject) {
        
        let num = Int(arc4random() % 10)
        
        currentProgress += num
        progressLabel.text = "\(currentProgress)%"
        if currentProgress >= 100 {
            
            currentProgress = 100
            progressLabel.text = "\(currentProgress)%"
            
        }
        
        progerssView.setProgress(progerssView.progress + num, aimated: true, withDuration: 0.50)
    }
    
    @IBAction func minusProgress(_ sender: AnyObject) {
        
        let num = Int(arc4random() % 10)
        
        currentProgress -= num
        progressLabel.text = "\(currentProgress)%"
        if currentProgress <= 0 {
            
            currentProgress = 0
            progressLabel.text = "\(currentProgress)%"
            
        }
        
        progerssView.setProgress(progerssView.progress - num, aimated: true, withDuration: 0.50)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

