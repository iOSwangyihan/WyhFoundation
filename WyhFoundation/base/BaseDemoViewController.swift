//
//  BaseDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit

class BaseDemoViewController: BaseViewController {
    var backSc = UIScrollView()
    var overview = UILabel()
    var exmaple = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.naviTyp = .back
        
        overview.scd.font(16).numberOfLines(0).text("")
        exmaple.scd.font(14).numberOfLines(0).text("").textColor(ColorName.rgbCR2.color)
        
        self.view.addSubview(backSc)
        backSc.addSubViews(views: [overview, exmaple])
        
        backSc.snp.makeConstraints { (m) in
            m.left.right.bottom.equalToSuperview()
            m.top.equalTo(navi.snp.bottom)
        }
        overview.snp.makeConstraints { (m) in
           
            m.left.equalTo(15)
            m.width.equalTo(UIScreen.main.bounds.width - 30)
            m.top.equalToSuperview()
        }
        
        exmaple.snp.makeConstraints { (m) in
            m.top.equalTo(overview.snp.bottom).offset(10)
            m.left.right.equalTo(overview)
            m.bottom.equalToSuperview()
        }
        // Do any additional setup after loading the view.
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
