//
//  PuViewController.swift
//  PetrounHappy
//
//  Created by 王乙涵 on 2020/8/7.
//  Copyright © 2020 com.petroun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    var navi = BaseNaviView()
    fileprivate var upTitle:String = ""
    
    private struct AssociatedKeys {
        static var barItemKey = "barItemKey"
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
   
    // 状态栏高度
    var statueHeight:CGFloat {
        get {
            if #available(iOS 13.0, *) {
                
                let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
                return statusBarManager?.statusBarFrame.size.height ?? 0.0

                } else {
                    return UIApplication.shared.statusBarFrame.height
                }
            
        }
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       
        navi.backBlock = {[weak self]()in
            self?.lefiBackActive()
        }
        navi.closeBlock = {[weak self]()in
            self?.closeBackActive()
        }
        navi.refreshBlock = {[weak self]()in
            self?.refreshBackActive()
        }
        self.view.addSubViews(views: [navi])
        navi.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                m.top.equalTo(self.view.safeAreaInsets)
            } else {
                m.top.equalToSuperview()
            }
            m.height.equalTo(44+statusHeight())
        }
        
        self.edgesForExtendedLayout = []


        self.view.backgroundColor = ColorName.f5F6F9.color

        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
  
    //判断当前定位是否可用
//    func isDeniedLoactionService() {
//        if CLLocationManager.authorizationStatus() == .denied {
//            self.alert(message: "请前往系统设置，开启”定位“权限允许获取位置信息", firstAction: "取消", secondAction: "去设置") {
//            } secondBlock: {
//                if let url = URL.init(string: UIApplication.openSettingsURLString) {
//                    if UIApplication.shared.canOpenURL(url) {
//                        UIApplication.shared.open(url, options: [:]) { (isSuccessed) in }
//                    }
//                }
//            }
//        }
//    }
    //导航栏高度
    func navHeight() -> CGFloat {
        //导航栏高度也可以根据BaseNavigationViewController动态获取
        var navh: CGFloat = 44.0

        
        if let s = UIScreen.main.currentMode?.size {
            let IS_IPHONE_X =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo(s) : false)
           
            if #available(iOS 12.0, *) {
                if let n = UIApplication.shared.delegate?.window, let t = n?.safeAreaInsets.top {
                    navh += CGFloat(t)
                }
                
            }else if IS_IPHONE_X {
               
                if let n = UIApplication.shared.delegate?.window, let t = n?.safeAreaInsets.top {
                    navh += CGFloat(t)
                }
                
            }else{
                navh += CGFloat(UIApplication.shared.statusBarFrame.size.height)
            }
        } else {
            if #available(iOS 12.0, *) {
                if let n = UIApplication.shared.delegate?.window, let t = n?.safeAreaInsets.top {
                    navh += CGFloat(t)
                }
                
            } else {
                navh += CGFloat(UIApplication.shared.statusBarFrame.size.height)
            }
        }
       
        return navh
    }
    //状态栏高度
    func statusHeight() -> CGFloat {
        
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 20
        } else {
            return UIApplication.shared.statusBarFrame.size.height 
        }
       
    }

    func popToOtherVC(target:UIViewController) {
        self.navigationController?.popToViewController(target, animated: true)
    }
    
    @objc func lefiBackActive() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeBackActive() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func refreshBackActive() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //光标移动位置
    func cusorLocation(text:UITextField, index:Int) {
        print("index is \(index)")
      
        let range = NSMakeRange(index, 0)
        guard let start = text.position(from: text.beginningOfDocument, offset: range.location) else { return  }
        guard let end = text.position(from: start, offset: range.length) else { return  }
       
        text.selectedTextRange = text.textRange(from: start, to: end)
    }

}

extension UIView {
    func addsubViews(views:[UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
