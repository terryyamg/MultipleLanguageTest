//
//  ViewController.swift
//  MultipleLanguageTest
//
//  Created by Terry Yang on 2017/8/22.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labMessage: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnEnglish(_ sender: UIButton) {
        UserDefaults.standard.set("Base", forKey: "lang") //儲存語系為基本
        setMessage()
    }
    
    @IBAction func btnJapan(_ sender: UIButton) {
        UserDefaults.standard.set("ja", forKey: "lang") //儲存語系為日文
        setMessage()
    }
    
    @IBAction func btnChinses(_ sender: UIButton) {
        UserDefaults.standard.set("zh-Hant", forKey: "lang") //儲存語系為繁體中文
        setMessage()
    }
    
    func setMessage() {
        labMessage.text = "A Song of Ice and Fire".localized //使用擴展功能 localized
    }

}

extension String{

    var localized: String {
                
        let lang = UserDefaults.standard.string(forKey: "lang")
        
        let bundle = Bundle(path: Bundle.main.path(forResource: lang, ofType: "lproj")!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        
    }
}
