//
//  SettingViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/10/20.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twtbtn(_ sender: UIButton) {
        let url = URL(string: "https://twitter.com/LiT121__")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)}
    }

    @IBAction func QAboxbtn(_ sender: UIButton) {
        let url = URL(string: "https://peing.net/ja/lit121__")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
