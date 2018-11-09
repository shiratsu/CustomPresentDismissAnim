//
//  NextVCL.swift
//  PresentModalTest
//
//  Created by 平塚 俊輔 on 2018/11/07.
//  Copyright © 2018 平塚 俊輔. All rights reserved.
//

import UIKit

class NextVCL: UIViewController {
    
    let kAnimator = CustomDismissAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.transitioningDelegate = self // delegateにselfを設定
    }

    @IBAction func dissmiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NextVCL: UIViewControllerTransitioningDelegate{
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // この画面に遷移してくるときに呼ばれるメソッド
        return kAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // この画面から遷移元に戻るときに呼ばれるメソッド
        return kAnimator
    }
}
