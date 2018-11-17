//
//  TableViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/08/25.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    // storyboardで使うtableviewを宣言
    @IBOutlet var table: UITableView!
    
    // タイトルを入れる配列
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // tableviewのデータソースメソッドはTableViewControllerクラスに書くという設定
        table.dataSource = self
        
        // titleArrayにタイトルを入れる
        titleArray = ["title1", "title2", "title3"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セルの数をtitleArrayの数にする
        return titleArray.count
    }
    // ID付きのセルを設定して、セル付属のtextlabelに「test」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // セルにtitleArrayのタイトルを表示する
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
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
