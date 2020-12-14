//
//  registerViewController.swift
//  LinePPoIApp
//
//  Created by YhamIVan on 2020/12/05.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    //    登録ボタン
    @IBOutlet weak var regBtn: UIButton!
    //    メールテキストフィールド
    @IBOutlet weak var mailTextField: UITextField!
    //    パスワードテキストフィールド
    @IBOutlet weak var passTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // ステータスバーを表示する
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //登録ボタン押下時の処理
    @IBAction func regBtnAct(_ sender: Any) {
        //        新規登録
        Auth.auth().createUser(withEmail: mailTextField.text!, password: passTextField.text!) { (user, error) in
            if error != nil{
                print(error as Any)
            }else{
                print("ユーザの作成が成功しました。")
                //チャット画面に遷移させる
                //関数なのでselfをつける
                self.performSegue(withIdentifier: "homeRegister", sender: nil)
                
            }
        }
    }
    
}
