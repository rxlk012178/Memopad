
//
//  ViewController.swift
//  QRcodeTest
//
//  Created by Tomoyuki Hayakawa on 2018/11/03.
//  Copyright © 2018 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit
import AVFoundation

class ReadQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var stringLabel: UILabel!
    var titleArray: [String] = []
    var dateArray: [String] = []
    var contentArray: [String] = []
    let SaveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if SaveData.object(forKey: "title") != nil && SaveData.object(forKey: "data") != nil && SaveData.object(forKey: "content") != nil {
            titleArray = SaveData.object(forKey: "title") as! [String]
            dateArray = SaveData.object(forKey: "data") as! [String]
            contentArray = SaveData.object(forKey: "content") as! [String]
            
        }
    }
    
    @IBAction func openCameraBtn(_ sender: Any) {
        
    }
    
    // 画面遷移する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先のVC
        let scanVC = segue.destination as! ScanViewController
        // ここに遷移で処理されて内容が戻ってくる
        scanVC.resultHandler = { getString in
            // この中でいろいろやる
            // テキストの分割とか
            self.stringLabel.text = getString
            self.dxtString(texts: getString)

        }
    }
    
    @IBAction func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // テキストから一行づつ文字列を抽出
    func dxtString(texts: String) {
        
        // 一行
        var line: String = ""
        // 一行の集まり
        var lines: [String] = []
        
        // textsを先頭から一文字づつ比較していく
        for char in texts { // textsの文字が順番にcharに入る
            // charの中身を比較
            if char == "*" { // 「*」だった場合
                lines.append(line) // 仮格納していたものを配列へ格納
                line = ""   // 仮格納をからにする
            } else {    // 「*」じゃなかった場合
                line.append(char)   // line(1行として)へ仮格納
            }
        }
        // 一番最後の行をしまう
        lines.append(line)
        print(lines)
        
        titleArray.append(lines[0])
        contentArray.append(lines[1])
        dateArray.append(lines[2])
        
        print(titleArray)
        
        SaveData.set(titleArray, forKey: "title")
        SaveData.set(dateArray, forKey: "date")
        SaveData.set(contentArray, forKey: "content")
        SaveData.synchronize()
        
    }
    
}
