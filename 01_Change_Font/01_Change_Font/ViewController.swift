//
//  ViewController.swift
//  01_Change_Font
//
//  Created by 杜流清 on 29/01/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.centerX.equalTo(self.view)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("Change Font", for: .normal)
        changeBtn.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        changeBtn.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        changeFont()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func changeFont() {
        let fontNames = UIFont.familyNames
        let r = Int.random(lower: 0, fontNames.count-1)
        label.font = UIFont(name: fontNames[r], size: 30)
        label.text = fontNames[r]
    }

}


// MARK: - extension for Int class. Generate a random number.
public extension Int {
    /// extension for Int class. Generate a random number.
    ///
    /// - Parameters:
    ///   - lower: lower bound of the range
    ///   - upper: upper bound of the range
    /// - Returns: a random int between the lower and the upper
    public static func random(lower: Int = 0, _ upper: Int = Int.max) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public static func random(range: Range<Int>) -> Int {
        return random(lower: range.lowerBound, range.upperBound)
    }
}

