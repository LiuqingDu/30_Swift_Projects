//
//  ViewController.swift
//  17_Face_Detect
//
//  Created by Liuqing Du on 2018/2/27.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let inputImageView = UIImageView()
    let outputImageView = UIImageView()
    
    let detectBtn = UIButton(type: UIButtonType.roundedRect)
    
    let cr = UILabel(frame: CGRect(x: 50, y: 650, width: 300, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputImageView.image = #imageLiteral(resourceName: "alexis")
        inputImageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        self.view.addSubview(inputImageView)
        
        detectBtn.setTitle("检测人脸", for: .normal)
        detectBtn.frame = CGRect(x: 50, y: 300, width: 200, height: 40)
        detectBtn.addTarget(self, action: #selector(detectFace), for: .touchUpInside)
        self.view.addSubview(detectBtn)
        
        outputImageView.frame = CGRect(x: 50, y: 400, width: 200, height: 200)
        outputImageView.backgroundColor  = UIColor.lightGray
        self.view.addSubview(outputImageView)
        
        cr.text = "Photo by Alexis Chloe on Unsplash"
        self.view.addSubview(cr)
        
    }
    
    @objc func detectFace() {
        
        let context = CIContext(options: nil)
        let inputImage = self.inputImageView.image
        let image = CIImage(cgImage: (inputImage?.cgImage)!)
        
        
        //MARK: 设置识别参数
        let param = [CIDetectorAccuracyHigh: CIDetectorAccuracy]
        
        //MARK: 声明CIDetector,设定识别类型
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: param)
        
        //MARK: 获取识别结果
        let detectResult = faceDetector?.features(in: image)
        let resultView = UIView(frame: self.inputImageView.frame)
        self.view.addSubview(resultView)
        
        if (detectResult?.count)! > 0 {
            
            let faceImage = image.cropped(to: (detectResult?[0].bounds)!)
            let face = UIImage(cgImage: context.createCGImage(faceImage, from: faceImage.extent)!)
            
            self.outputImageView.image = face
            
        } else {
            return
        }
        
        for item in detectResult! {
            
            print("aaaaaaaaaaaaaaaaaaaaaaaaa")
            let faceFeature = item as! CIFaceFeature
            let faceView = UIView(frame: faceFeature.bounds)
            print(faceFeature.bounds)
            faceView.layer.borderWidth = 1
            faceView.layer.borderColor = UIColor.green.cgColor
            resultView.addSubview(faceView)
            
            //MARK: 左眼
            if faceFeature.hasLeftEyePosition {
                
                let leftEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                leftEyeView.center = faceFeature.leftEyePosition
                leftEyeView.layer.borderColor = UIColor.green.cgColor
                leftEyeView.layer.borderWidth = 1
                resultView.addSubview(leftEyeView)
            }
            
            //MARK: 右眼
            if faceFeature.hasRightEyePosition {
                
                let rightEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                rightEyeView.center = faceFeature.rightEyePosition
                rightEyeView.layer.borderColor = UIColor.green.cgColor
                rightEyeView.layer.borderWidth = 1
                resultView.addSubview(rightEyeView)
            }
            
            //MARK: 嘴巴
            if faceFeature.hasMouthPosition {
                
                let mouthView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
                mouthView.center = faceFeature.mouthPosition
                mouthView.layer.borderColor = UIColor.green.cgColor
                mouthView.layer.borderWidth = 1
                resultView.addSubview(mouthView)
            }
        }
        
        //MARK: 变换坐标
        print(resultView.bounds)
        resultView.transform = CGAffineTransform(scaleX: 1, y: -1)
        print(resultView.bounds)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

