//
//  HomeViewController.swift
//  LinePPoIApp
//
//  Created by YhamIVan on 2020/12/12.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // ステータスバーを非表示にする
        self.navigationController?.navigationBar.isHidden = true
    }
}
