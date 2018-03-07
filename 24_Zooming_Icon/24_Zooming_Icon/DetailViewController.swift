//
//  DetailViewController.swift
//  24_Zooming_Icon
//
//  Created by Liuqing Du on 2018/3/7.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ZoomingIconViewController {
    var item: SocialItem?
    
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var backButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var summaryLabelBottomConstraint: NSLayoutConstraint!
    
    @IBAction func handleBackButton(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    func setupState(_ initial: Bool) {
        if initial {
            backButtonTopConstraint.constant = -64
            summaryLabelBottomConstraint.constant = -200
        }
        else {
            backButtonTopConstraint.constant = 0
            summaryLabelBottomConstraint.constant = 80
        }
        view.layoutIfNeeded()
    }
    
    func zoomingIconTransition(_ transition: ZoomingIconTransition, willAnimateTransitionWithOperation operation: UINavigationControllerOperation, isForegroundViewController isForeground: Bool) {
        setupState(operation == .push)
        
        UIView.animate(withDuration: 0.6, delay: operation == .push ? 0.2 : 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
        
            self.setupState(operation == .pop)
            }) { (finished) -> Void in
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let item = item {
            coloredView.backgroundColor = item.color
            imageView.image = item.image
            
            titleLabel.text = item.name
            summaryLabel.text = item.summary
        }
        else {
            coloredView.backgroundColor = UIColor.gray
            imageView.image = nil
            
            titleLabel.text = nil
            summaryLabel.text = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func zoomingIconColoredViewForTransition(_ transition: ZoomingIconTransition) -> UIView! {
        return coloredView
    }
    
    func zoomingIconImageViewForTransition(_ transition: ZoomingIconTransition) -> UIImageView! {
        return imageView
    }
    
}
