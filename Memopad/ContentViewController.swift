//
//  ContentViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/08/19.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setSwipeBack() {
        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
    }
}

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
    
    var index: Int!
    
    var count: Int = 0
    
    var diaries: [[String: Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwipeBack()

        // Do any additional setup after loading the view.
        monthLabel.text = String(month!)
        dayLabel.text = String(day!)
        
        print(year!)
        print(month!)
        print(day!)
        
        
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
        
        //textFiled.text = "" 空にする文！！！！！！！
        
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
                
                print(self.index)
                
                self.diaries = (self.saveData.array(forKey: "diary") as? [[String: Any]])!
                
                self.diaries.remove(at: self.count)
                
                self.saveData.set(self.diaries, forKey: "diary")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                   // self.performSegue(withIdentifier: "toCalenderVC", sender: nil)
                   // self.dismiss(animated: true, completion: nil)
                    self.navigationController?.popViewController(animated: true)
                }
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
    


        
        
        


}
