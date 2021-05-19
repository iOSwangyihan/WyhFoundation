//
//  ViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

import UIKit

class ViewController: UIViewController {
    var explain = UILabel()
    var start = UIButton()
    var startOc = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        explain.scd.font(16).numberOfLines(0).textColor(ColorName._05064C.color).text("因为很多东西时间久了，没有用到，经常会遗忘，需要回去补一补，但是却没有系统的大纲，不知从何补起，不知哪些遗忘，为了解决这个问题，才打算弄这个项目.\n\n打算自己边学习边集合到项目内，最后做成framework，方便平时使用.")
        start.scd.title("开始学习 for Swift", for: .normal).font(16).titleColor(ColorName.f4F8Ff.color, for: .normal).cornerRadius(20).backgroundColor(ColorName._105Be5.color, for: .normal)
        start.addTarget(self, action: #selector(startSwiftAction), for: .touchUpInside)
        startOc.scd.title("开始学习 for OC", for: .normal).font(16).titleColor(ColorName.f4F8Ff.color, for: .normal).cornerRadius(20).backgroundColor(ColorName._105Be5.color, for: .normal)
        startOc.addTarget(self, action: #selector(startOcAction), for: .touchUpInside)
        
        self.view.addSubViews(views: [explain, start, startOc])
        
        explain.snp.makeConstraints { (m) in
            m.top.equalTo(100)
            m.left.equalTo(15)
            m.right.equalToSuperview().offset(-15)
        }
        
        start.snp.makeConstraints { (m) in
            m.top.equalTo(explain.snp.bottom).offset(50)
            m.width.equalTo(150)
            m.height.equalTo(40)
            m.centerX.equalToSuperview()
        }
        startOc.snp.makeConstraints { (m) in
            m.top.equalTo(start.snp.bottom).offset(10)
            m.width.equalTo(150)
            m.height.equalTo(40)
            m.centerX.equalToSuperview()
        }
    }

    @objc func startSwiftAction() {
        
        let vc = SwiftViewController()
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    @objc func startOcAction() {
        
        let vc = OcViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

