//
//  TutorialViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2019/03/28.
//  Copyright © 2019 YuiMatsuda. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func SetSwipeBack() {
        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
    }
}

class TutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SetSwipeBack()

        // Do any additional setup after loading the view.
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
