//
//  BaseNaviView.swift
//  GtOilRapid
//
//  Created by 王乙涵 on 2020/11/19.
//

import UIKit
enum BaseNaviType {
    case back
    case close
    case web
    case finish
    case none
    case rule
    case whiteBack
    case imgClose
}
class BaseNaviView: BaseView {
    var title : String? {
        didSet {
            titleLb.text = title
        }
    }
    var titleLb = UILabel()
    var backButton = UIButton()
    @objc  var backBlock : (() -> Void)?
    var closeButton = UIButton()
    @objc var closeBlock : (() -> Void)?
    var refreshButton = UIButton()
    @objc  var refreshBlock : (() -> Void)?
    
    var naviTyp : BaseNaviType = .back {
        didSet {
            switch naviTyp {
            case .whiteBack:
                backButton.isHidden = false
                closeButton.isHidden = true
                refreshButton.isHidden = true
                backButton.setImage(Asset.Base.icBackBlack.image, for: .normal)
                backButton.setTitle("", for: .normal)
            case .back:
               
                backButton.isHidden = false
                closeButton.isHidden = true
                refreshButton.isHidden = true
                backButton.setImage(Asset.Base.icBackBlack.image, for: .normal)
                backButton.setTitle("", for: .normal)
                
            case .web:
                backButton.isHidden = false
                closeButton.isHidden = false
                refreshButton.isHidden = false
                backButton.setImage(Asset.Base.icBackBlack.image, for: .normal)
                refreshButton.setImage(Asset.Base.icRefresh.image, for: .normal)
                backButton.setTitle("", for: .normal)
            case .close:
                backButton.isHidden = false
                closeButton.isHidden = true
                refreshButton.isHidden = true
                backButton.setImage(nil, for: .normal)
                backButton.setTitle("关闭", for: .normal)
            case .imgClose:
                backButton.isHidden = false
                closeButton.isHidden = true
                refreshButton.isHidden = true
                backButton.setImage(nil, for: .normal)
                backButton.setTitle("", for: .normal)
                backButton.setImage(Asset.Base.icNavClose.image, for: .normal)
            case .finish:
                backButton.isHidden = true
                closeButton.isHidden = true
                refreshButton.isHidden = false
                refreshButton.setImage(nil, for: .normal)
                refreshButton.setTitle("完成", for: .normal)
            case .rule:
                backButton.isHidden = false
                closeButton.isHidden = true
                refreshButton.isHidden = false
                backButton.setImage(Asset.Base.icBackBlack.image, for: .normal)
                backButton.setTitle("", for: .normal)
                refreshButton.setImage(nil, for: .normal)
                refreshButton.setTitle("活动规则", for: .normal)
            case .none:
                backButton.isHidden = true
                closeButton.isHidden = true
                refreshButton.isHidden = true
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @objc func backAction() {
        if let b = backBlock {
            b()
        }
    }
    @objc func closeAction() {
        if let b = closeBlock {
            b()
        }
    }
    @objc func refreshAction() {
        if let b = refreshBlock {
            b()
        }
    }
   
    override func makeUI() {
        
        backButton.setImage(Asset.Base.icBackBlack.image, for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        backButton.setTitleColor(.black, for: .normal)
        closeButton.setImage(Asset.Base.icNavClose.image, for: .normal)
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        closeButton.setTitleColor(.black, for: .normal)
        refreshButton.setImage(Asset.Base.icRefresh.image, for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshAction), for: .touchUpInside)
        refreshButton.setTitleColor(.black, for: .normal)
        refreshButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        refreshButton.titleLabel?.textAlignment = .right
        refreshButton.imageEdgeInsets = .init(top: 0, left: 44, bottom: 0, right: 0)
        backButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
        closeButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
        naviTyp = .none
        self.backgroundColor = ColorName.f5F6F9.color
        titleLb.scd.boldFont(18).text("").textColor(.black).textAlignment(.center)
        self.addSubViews(views: [titleLb, backButton, closeButton, refreshButton])
        
        titleLb.snp.makeConstraints { (m) in
            m.bottom.equalToSuperview().offset(-13)
            m.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (m) in
            m.centerY.equalTo(titleLb)
            m.left.equalToSuperview().offset(15)
            m.width.equalTo(40)
           
        }
        closeButton.snp.makeConstraints { (m) in
            m.centerY.equalTo(titleLb)
            m.left.equalTo(backButton.snp.right)
            m.width.equalTo(40)
       
        }
        
        refreshButton.snp.makeConstraints { (m) in
            m.centerY.equalTo(titleLb)
            m.right.equalToSuperview().offset(-10)
            m.width.equalTo(80)
          
        }
       
    }
}
