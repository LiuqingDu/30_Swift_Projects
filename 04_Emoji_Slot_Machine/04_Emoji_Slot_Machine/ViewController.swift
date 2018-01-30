//
//  ViewController.swift
//  04_Emoji_Slot_Machine
//
//  Created by Liuqing Du on 30/01/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var emojiArray = ["🐭", "🐮", "🐯", "🐰",
                      "🐉", "🐍", "🐴", "🐑",
                      "🐵", "🐔", "🐶", "🐷"]
    var result_Label: UILabel!
    var slotMachine: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initGame()
    }
    
    func initGame() {
        slotMachine = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120))
        self.view.addSubview(slotMachine)
        slotMachine.delegate = self
        slotMachine.dataSource = self
        slotMachine.center.x = self.view.center.x
        slotMachine.center.y = self.view.center.y - 100
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count - 2) + 1, inComponent: 2, animated: true)
        
        let start_Btn = UIButton(type: .roundedRect)
        self.view.addSubview(start_Btn)
        start_Btn.frame = CGRect(x: 0, y: 0, width: 275, height: 60)
        start_Btn.setTitle("Start", for: .normal)
        start_Btn.center.x = self.view.center.x
        start_Btn.center.y = self.view.center.y + 100
        start_Btn.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        result_Label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        result_Label.text = ""
        self.view.addSubview(result_Label)
        result_Label.center.x = self.view.center.x
        result_Label.center.y = self.view.center.y + 150
        
        let winGesture = UILongPressGestureRecognizer(target: self, action: #selector(winGame))
        winGesture.minimumPressDuration = 1.0
        start_Btn.addGestureRecognizer(winGesture)
    }
    
    @objc func start(sender: UIButton) {
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count * 10 - 2) + 1, inComponent: 0, animated: true)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count * 10 - 2) + 1, inComponent: 1, animated: true)
        slotMachine.selectRow(Int(arc4random())%(emojiArray.count * 10 - 2) + 1, inComponent: 2, animated: true)
        self.judge()
    }
    
    func judge() {
        if (slotMachine.selectedRow(inComponent: 0) == slotMachine.selectedRow(inComponent: 1)
            && slotMachine.selectedRow(inComponent: 1) == slotMachine.selectedRow(inComponent: 2)) {
            result_Label.text = "You Win"
        } else {
            result_Label.text = "You Lose"
        }
    }
    
    @objc func winGame() {
        let n = Int(arc4random())%(emojiArray.count * 10 - 2) + 1
        slotMachine.selectRow(n, inComponent: 0, animated: true)
        slotMachine.selectRow(n, inComponent: 1, animated: true)
        slotMachine.selectRow(n, inComponent: 2, animated: true)
        self.judge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emojiArray[row % 10]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count * 10
    }

}

