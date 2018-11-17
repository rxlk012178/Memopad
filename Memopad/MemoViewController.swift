//
//  MemoViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/05/19.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var contentImageView: UIImageView!
    
    @IBOutlet weak var datetextField: UITextField!
    var datePicker: UIDatePicker = UIDatePicker()
    
    var Title: String?
    var Content: String?
    
    // @IBOutlet var datePicker: UIDatePicker!
    
    let saveData: UserDefaults = UserDefaults.standard
    
    // 画像加工するための元の画像
    // var originalImage: UIImage!
    // 画像加工するフィルターの宣言
    // var filter: CIFilter!
    
    @objc func commitButtonTapped (){
        self.view.endEditing(true)
    }
    
    // タイトルの配列
    var titleLabel:[String] = ["day0","day1","day2","day3"]
    // 内容の配列
    var textLabel:[String] = ["day0","day1","day2","day3"]
    // 画像の配列
    var imageArray:[String] = ["day0","day1","day2","day3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titleTextField.text = saveData.object(forKey: "title") as? String
        //contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(commitButtonTapped))
        
        kbToolBar.items = [spacer, commitButton]
        
        
        contentTextView.inputAccessoryView = kbToolBar
        
        
        
        // ピッカー設定
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        datetextField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
        datetextField.inputView = datePicker
        datetextField.inputAccessoryView = toolbar
        
        
        
        
    }
    
    
    // 決定ボタン押下
    @objc func done() {
        datetextField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年M月dd日"
        datetextField.text = "\(formatter.string(from: Date()))"
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveMemo() {
        var diaries = saveData.array(forKey: "diary") ?? []
        
        let dic = [
            "date": datePicker.date,
            "title": titleTextField.text!,
            "content": contentTextView.text!,
            "image": UIImagePNGRepresentation(contentImageView.image!)! as NSData
            ] as [String : Any]
        
        diaries.append(dic)
        saveData.set(diaries, forKey: "diary")
        
        print(saveData.array(forKey: "diary") ?? [""])
        
     /* UserDefaultに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")*/
        
        // アラートを出す
        let alert: UIAlertController = UIAlertController(title: "保存完了", message: "メモの保存が完了しました", preferredStyle: .alert)
        // OKボタン
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    // ボタンが押されたときの動作
                    self.navigationController?.popViewController(animated: true)
            }))
        present(alert, animated: true, completion: nil)
    }
    
    // 保存後に自動で戻る
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // 写真撮影
    @IBAction func useCamera() {
        // カメラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        } else {
            // 使えない場合エラーをコンソールに出す
            print("error")
        }
    }
    
    //選択した画像をアプリ内に表示する
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        contentImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        // カメラで写真を撮った後にその画像を加工する前の元画像として記憶しておく
        
        dismiss(animated: true, completion: nil)
    }
    
    // カメラロールを読み込む
    @IBAction func openAlbum() {
        // カメラロールを使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // カメラロールの画像を選択して表示する
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)

        }
        
    }
    
    /* セグエを準備(prepare)する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContentView" {
            let contentViewController = segue.destination as! ContentViewController
            contentViewController.year = self.Title
            contentViewController.month = self.Content
        }*/
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
