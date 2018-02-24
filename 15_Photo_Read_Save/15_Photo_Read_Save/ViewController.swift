//
//  ViewController.swift
//  15_Photo_Read_Save
//
//  Created by Liuqing Du on 2018/2/24.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageView = UIImageView()
    let selectImageBtn = UIButton(type: .roundedRect)
    let saveImageBtn = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "sun")
        self.view.addSubview(imageView)
        
        selectImageBtn.frame = CGRect(x: 100, y: 400, width: 100, height: 40)
        selectImageBtn.setTitle("选择图片", for: .normal)
        selectImageBtn.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        self.view.addSubview(selectImageBtn)
        
        saveImageBtn.frame = CGRect(x: 100, y: 500, width: 100, height: 40)
        saveImageBtn.setTitle("保存图片", for: .normal)
        saveImageBtn.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        self.view.addSubview(saveImageBtn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func selectImage() {
        let alert = UIAlertController(title: "选择图片", message: "", preferredStyle: .actionSheet)
        let selectFromAlbumAction = UIAlertAction(title: "从相册选择", style: .default, handler: selectFromAlbum)
        alert.addAction(selectFromAlbumAction)
        
        let selectFromCameraAction = UIAlertAction(title: "从相机拍照", style: .default, handler: selectFromCamera)
        alert.addAction(selectFromCameraAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func saveImage() {
        let image = imageView.image
        UIImageWriteToSavedPhotosAlbum(image!, self, #selector(savedImage), nil)
        
    }
    
    @objc func savedImage(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if (error == nil) {
            let alertController = UIAlertController(title: "已保存到相册", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func selectFromAlbum(_ alertAction: UIAlertAction) -> Void {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let picker = UIImagePickerController()
            
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            
            self.present(picker, animated: true, completion: nil)
            
        }
    }
    
    func selectFromCamera(_ alertAction: UIAlertAction) -> Void {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let picker = UIImagePickerController()
            
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            
            self.present(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }


}

