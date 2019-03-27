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
    
    @IBAction func sharebtn(_ sender: UIButton) {
        // 共有する文章
        let shareText = "Excanjourで友達との交換日記を楽しもう！ #Excanjour"
        
        //投稿するコメントの準備
        let activityItems = [shareText] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        activityVC.navigationController?.popViewController(animated: false)
        
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func reviewbtn() {
        let url = URL(string: "")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)}
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
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

