//
//  ViewController.swift
//  05_Photo_Viewer
//
//  Created by Liuqing Du on 02/02/2018.
//  Copyright © 2018 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isMultipleTouchEnabled = true
        
        imageView = UIImageView(image: UIImage(named: "image"))
        
        setUpScrollView()
        scrollView.delegate = self
        
        setZoomScale(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScale(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    fileprivate func setUpScrollView() {
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    fileprivate func setZoomScale(_ scrollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimumScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimumScale
        scrollView.maximumZoomScale = 2.5
    }
    
    fileprivate func recenterImage() {
        
        var horizonSpace = CGFloat()
        var verticalSpace = CGFloat()
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        
        if imageViewSize.width < scrollViewSize.width {
            horizonSpace = (scrollViewSize.width - imageViewSize.width) / 2.0
        } else {
            horizonSpace = 0.0
        }
        
        if imageViewSize.height < scrollViewSize.height {
            verticalSpace = (scrollViewSize.height - scrollViewSize.height) / 2.0
        } else {
            verticalSpace = 0.0
        }
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizonSpace, verticalSpace, horizonSpace)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterImage()
    }
    
}

