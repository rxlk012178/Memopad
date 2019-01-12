//
//  ContentViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/08/19.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet var monthLabel:UILabel!
    @IBOutlet var dayLabel:UILabel!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var contentimageView:UIImageView!

    let saveData: UserDefaults = UserDefaults.standard
   
    
    var year: Int?
    var month: Int?
    var day: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        monthLabel.text = String(month!)
        dayLabel.text = String(day!)
        
        
        
        // UDから日記一覧を取ってくる
        if let diaries = saveData.array(forKey: "diary") as? [[String: Any]] {
            
            // 年月日でフィルターかけて検索する
            let diary = diaries.filter { diary in
                if let date = diary["date"] as? Date {
                    return date.year == self.year && date.month == self.month && date.day == self.day
                } else {
                    return false
                }
            }.first
            
            // ラベルに表示させる
            titleLabel.text = diary?["title"] as? String
            contentLabel.text = diary?["content"] as? String
            
            let nsData = diary?["image"] as! NSData
            contentimageView.image = UIImage(data: Data(referencing: nsData))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func share(_ sender: UIButton) {
        
        
        self.performSegue(withIdentifier: "toShare", sender: nil)
    }
        
    // このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toShare" {
            
            let shareViewController:ShareViewController = segue.destination as! ShareViewController
            
            // 変数:遷移先ViewController型 = segue.destinationViewController as 遷移先ViewController型
            // segue.destinationViewController は遷移先のViewController
            
            shareViewController.titleText = self.titleLabel.text!
            shareViewController.contentText = self.contentLabel.text!
            shareViewController.month = self.month
            shareViewController.day = self.day
            shareViewController.contentimageView = self.contentimageView.image!
        }
    }
    
    @IBAction func deleteButton() {
        
        // アラートを出す
            let alertController = UIAlertController(title: "削除",message: "本当にこの日記を削除してもいいですか？", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
                UserDefaults.standard.removeObject(forKey: "diary")
            }
            let cancelButton = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler: nil)
        
            alertController.addAction(okAction)
            alertController.addAction(cancelButton)
            
            present(alertController,animated: true,completion: nil)
    }
    
 /*//削除のボタン
    @IBAction func deleteButton(_ sender: Any) {
        removeObjectForKey("diary")
        defaults.synchronize()
 }*/
    


        
        
        
        
        /* // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityType.postToFacebook,
            UIActivityType.postToTwitter,
            UIActivityType.message,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print,
            UIActivityType.copyToPasteboard,
            UIActivityType.mail,
            UIActivityType.assignToContact,
            UIActivityType.addToReadingList,
            UIActivityType.postToFlickr,
            UIActivityType.postToVimeo,
            UIActivityType.postToWeibo,
            UIActivityType.postToTencentWeibo,
            UIActivityType.openInIBooks,
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
         self.present(activityVC, animated: true, completion: nil)*/
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


