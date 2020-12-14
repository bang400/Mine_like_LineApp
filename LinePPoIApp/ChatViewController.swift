//
//  ChatViewController.swift
//  LinePPoIApp
//
//  Created by YhamIVan on 2020/12/13.
//


//テストユーザメール
//testuser@email.com
//111111

import UIKit
import Firebase

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    //チャット用テーブルビュー
    @IBOutlet weak var chatTableView: UITableView!
    
    //    チャット入力テキストフィールド
    @IBOutlet weak var chatTextField: UITextField!
    
    //    チャットの配列を定義
    var chatArray = [MessageModel]()
    
    //    チャットの色指定
    // RGBA; red: 赤, green: 緑, blue: 青, a: 透明度
    let rgba = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
    let rgba2 = UIColor(red: 1/3, green: 1/3, blue: 1/3, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = false
        
        chatTableView.register(UINib(nibName: "SingleCell", bundle:nil), forCellReuseIdentifier: "Cell")
        
        //デリゲートメソッドの準備
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        //        Firebaseからデータをfetchしてくる
        fetchChatData()
        chatTableView.separatorStyle = .none
    }
    
    //テーブルの実装------------------------------------------------------------------------------------------
    
    //    numberOfSections
    //    ①まずはセクションの数を確認しにいく
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //    numberOfRowsInSection
    //    ②チャットの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        メッセージの数
        return chatArray.count
    }
    
    //    cellForRowAt
    //    indexPathはインクリメントされる
    //    cellForRowAtはnumberOfRowsInSection(セクションの中にあるセルの数)の分だけ呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SingleCell
        //テーブルに反映せる
        //メッセージをセルに配置する
        cell.comments_SIngleCell.text = chatArray[indexPath.row].message
        
        cell.userName_SingleCell.text = chatArray[indexPath.row].sender
        
        cell.img_SingleCell.image = UIImage(named: "b2")
        
        if cell.userName_SingleCell.text == Auth.auth().currentUser?.email as! String{
            //        セルの色をライトグリーンに変更する
            cell.comments_SIngleCell.backgroundColor = rgba
        }else {
            //        セルの色を灰色に変更する
            cell.comments_SIngleCell.backgroundColor = rgba2
            cell.comments_SIngleCell.textColor = .white
        }
        return cell
    }
    
    //セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    送信ボタンを押下したときの処理
    @IBAction func sendBtnAct(_ sender: Any) {
                                
        //        FirebaseのDBに入れる
        //        let chatDB = Database.database().reference().child("chat_data")ここの部分を変えることでチャットグループを作成できるかも？
        let chatDB = Database.database().reference().child("chat_data")
        //        キーバリュー型で内容を送信
        let messageinfo = [
            "sender":Auth.auth().currentUser?.email,
            "message":chatTextField.text!
        ]
        
        //chatDBに入れる
        chatDB.childByAutoId().setValue(messageinfo){(error,
            result) in
            
            if error != nil {
                print(error)
            }else{
                print("送信完了！")
            }
        }
    }
        
    //    chatデータを引っ張ってくる
    func fetchChatData(){
        //    chatデータをどこから引っ張ってくるか
        let fetchDataRef =
            Database.database().reference().child("chat_data")
        //      新しく更新が入ってきたときに取得したい
        //        snapShotにデータが入ると中身が実行されるメソッド
        fetchDataRef.observe(.childAdded){(snapShot) in
            
            let snapShotData = snapShot.value as AnyObject
            //            print(snapShotData)
            let sender = snapShotData.value(forKey: "sender")
            //            print(sender)
            let text = snapShotData.value(forKey: "message")
            
            let message = MessageModel()
            message.sender = sender as! String
            message.message = text as! String
            self.chatArray.append(message)
            self.chatTableView.reloadData()
        }
        
    }
    
}
