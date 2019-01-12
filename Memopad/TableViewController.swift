//
//  TableViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/08/25.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titleArray: [String] = []
    var dateArray: [String] = []
    var contentArray: [String] = []
    let SaveData: UserDefaults = UserDefaults.standard
    
    //@IBOutlet var tableView: UITableView!
    
    let array: [String] = ["aaa", "bbb"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
//        if SaveData.object(forKey: "title") != nil && SaveData.object(forKey: "date") != nil && SaveData.object(forKey: "content") != nil {
//            titleArray = SaveData.object(forKey: "title") as! [String]
//            dateArray = SaveData.object(forKey: "date") as! [String]
//            contentArray = SaveData.object(forKey: "content") as! [String]
//
//        }
//        print(titleArray)
//        tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)

        let label = cell.viewWithTag(1) as! UILabel
        label.text = array[indexPath.row]

         //セルに表示する値を設定する

        return cell
    }

    // セルが選択された時に呼ばれるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
