//
//  LoginViewController.swift
//  LinePPoIApp
//
//  Created by YhamIVan on 2020/12/05.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var mailLoginTextFeild: UITextField!
    @IBOutlet weak var passLoginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
        
        // showBackButtonTitle
        //        navigationController?.topViewController?.navigationItem.backButtonDisplayMode = .default
    }
    
    //    再びホーム画面を表示してもボタンを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //    戻るボタンを表示する
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        showBackButtonTitleOnViewWillDisappear()
//    }
    
    //    ログインボタンが押されたときの処理
    @IBAction func loginBtnAct(_ sender: Any) {
        
        Auth.auth().signIn(
            withEmail: mailLoginTextFeild.text!,
            password: passLoginTextField.text!) { (user, error) in

            if error != nil{
                print("ログイン失敗")
                print(error as Any)

            }else{
                print("ログイン成功")
                //ホーム画面に遷移させる                
                //関数なのでselfをつける
                self.performSegue(withIdentifier: "homeLogin", sender: nil)
                
            }
        }
    }
    
}
