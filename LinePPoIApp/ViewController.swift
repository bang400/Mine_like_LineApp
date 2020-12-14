//
//  ViewController.swift
//  LinePPoIApp
//
//  Created by YhamIVan on 2020/12/05.
//

import UIKit

class ViewController: UIViewController {

    //    新規登録ボタン
    @IBOutlet weak var registerBtn: UIButton!
    //    ログインボタン
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
        //        ボタン装飾
        //        ボタンをくっつける方法調べる
        self.loginBtn.layer.borderColor = UIColor.black.cgColor
        self.loginBtn.layer.borderWidth = 1.5
        
        self.registerBtn.layer.borderColor = UIColor.black.cgColor
        self.registerBtn.layer.borderWidth = 1.5        
    }
    
    //    戻ってきたときにもステータスバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
    }
}

