//
//  ShareViewController.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/09/08.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    // ここで受け取る
    var titleText:String!
    var contentText:String!
    var month: Int!
    var day: Int!
    var contentimageView:UIImage!
    var dateText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 日付持ってくる
        
        dateText = String(month) + "/" + String(day)
        print(dateText)
        let sumStr = titleText + "*" + contentText + "*" + dateText // 日付たす
        
       // print(sumStr)
        
        //let activityItems: [Any] = [titleText!, contentText!, contentimageView!]
        
        let data = sumStr.data(using: String.Encoding.utf8)!
        //print(data)
        
        // QRコードを生成する
        let qr = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        //作成したQRコードを表示する
        let qrImageView = UIImageView()
        qrImageView.contentMode = .scaleAspectFit
        qrImageView.frame = self.view.frame
        qrImageView.image = uiImage
        self.view.addSubview(qrImageView)
        
//        print(titleText)
//        print(contentText)
//        print(contentimageView)
    }
    
    @IBAction func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
