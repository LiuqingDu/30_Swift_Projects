//
//  ViewController.swift
//  19_Vertical_Menu_Transition
//
//  Created by Liuqing Du on 2018/3/1.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomTransitionDelegate,UIViewControllerTransitioningDelegate {
    var transition = CustomTransition()
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgView = UIImageView(frame: self.view.frame)
        imgView.image = #imageLiteral(resourceName: "Photo")
        self.view.addSubview(imgView)
        let menuButtonBar = UIBarButtonItem(title: "🎾", style: .plain, target: self, action: #selector(triggerMenu))
        self.navigationItem.leftBarButtonItem = menuButtonBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func triggerMenu() {
        let menuViewController = MenuViewController()
        menuViewController.transitioningDelegate = self
        menuViewController.modalPresentationStyle = .custom
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = .Dismiss
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.delegate = self
        transition.navigationType = .Present
        return transition
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

public enum ViewControllerNavigationType:Int {
    case Present = 0
    case Dismiss = 1
}


