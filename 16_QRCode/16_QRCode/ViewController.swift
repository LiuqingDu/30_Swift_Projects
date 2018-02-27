//
//  ViewController.swift
//  16_QRCode
//
//  Created by Liuqing Du on 2018/2/26.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let qrImage = UIImageView()
    let txt = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        qrImage.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        qrImage.backgroundColor = UIColor.darkGray
        self.view.addSubview(qrImage)
        txt.frame = CGRect(x: 100, y: 400, width: 200, height: 40)
        txt.borderStyle = .roundedRect
        self.view.addSubview(txt)
        
        let generate = UIButton(type: .roundedRect)
        generate.setTitle("生成二维码", for: .normal)
        generate.frame = CGRect(x: 100, y: 500, width: 100, height: 40)
        generate.addTarget(self, action: #selector(generateBtn), for: .touchUpInside)
        self.view.addSubview(generate)
    }
    
    @objc func generateBtn() {
        qrImage.image = generateQRCode(qrString: txt.text)
    }
    
    func generateQRCode(qrString: String?) -> UIImage?{
        if let sureQRString = qrString {
            let stringData = sureQRString.data(using: .utf8,
                                               allowLossyConversion: false)
            // 创建一个二维码的滤镜
            let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
            qrFilter.setValue(stringData, forKey: "inputMessage")
            qrFilter.setValue("H", forKey: "inputCorrectionLevel")
            let qrCIImage = qrFilter.outputImage
            
            // 创建一个颜色滤镜,黑白色
            let colorFilter = CIFilter(name: "CIFalseColor")!
            colorFilter.setDefaults()
            colorFilter.setValue(qrCIImage, forKey: "inputImage")
            colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
            colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
            
            // 返回二维码image
            let codeImage = UIImage(ciImage: colorFilter.outputImage!
                .transformed(by: CGAffineTransform(scaleX: 5, y: 5)))
            
            return codeImage
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

