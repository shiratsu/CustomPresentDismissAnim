//
//  ViewController.swift
//  PresentModalTest
//
//  Created by 平塚 俊輔 on 2018/11/07.
//  Copyright © 2018 平塚 俊輔. All rights reserved.
//

import UIKit
import TestFramework

class ViewController: UIViewController {
    
    let kAnimator = CustomPresentAnimator()
    
    var presentTransition: UIViewControllerAnimatedTransitioning? = CustomPresentAnimator()
    var dismissTransition: UIViewControllerAnimatedTransitioning? = CustomDismissAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UDWrapper.setString(key: "test", value: "teststest")
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    @IBAction func showNext(_ sender: Any) {
        
        presentTransition = CustomPresentAnimator()
        dismissTransition = CustomDismissAnimator()
        
        let vc = NextVCL(nibName: "NextVCL", bundle: nil)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self // delegateにselfを設定
        
        present(vc, animated: true, completion: { [weak self] in
            self?.presentTransition = nil
            })
    }
}

extension ViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // この画面に遷移してくるときに呼ばれるメソッド
        return presentTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // この画面から遷移元に戻るときに呼ばれるメソッド
        return dismissTransition
    }
}

