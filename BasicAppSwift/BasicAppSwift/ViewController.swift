//
//  ViewController.swift
//  BasicAppSwift
//
//  Created by shangkun on 2021/9/10.
//

import UIKit
import Flutter
import flutter_boost

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(type: .system)
        button.setTitle("跳转", for: .normal)
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        button.addTarget(self, action:#selector(self.handleButtonAction), for:.touchUpInside)
        self.view.addSubview(button)
    }
    
    
    @objc func handleButtonAction() {
        let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine;
        let flutterViewController = FlutterViewController(engine: flutterEngine!, nibName: nil, bundle: nil);
        self.present(flutterViewController, animated: true, completion: nil)
      }

}

