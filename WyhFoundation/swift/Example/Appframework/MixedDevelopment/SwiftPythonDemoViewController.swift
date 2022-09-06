//
//  SwiftPythonDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//





import UIKit

class SwiftPythonDemoViewController: SwiftViewController {
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataArr = []
        let openUrlBt = UIButton()
        openUrlBt.scd.backgroundColor(ColorName._0947D4.color).cornerRadius(20).title("打开查看")
        openUrlBt.addTarget(self, action: #selector(openUrl), for: .touchUpInside)
        
        self.view.addSubview(openUrlBt)
        
        openUrlBt.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func openUrl(){
        
        if let ourl = URL(string: url) {
            UIApplication.shared.open(ourl)
        } else {
            
        }
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
