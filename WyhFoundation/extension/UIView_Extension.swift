//
//  UIView_Extension.swift
//  VStore
//
//  Created by 王乙涵 on 2019/10/9.
//  Copyright © 2019 Store Oil. All rights reserved.
//

import UIKit

extension UIView {
   
    func addSubViews(views:[UIView]) {
        views.forEach { (v) in
            self.addSubview(v)
        }
    }
    
    // 阴影
    func addShadow(view:UIView,size:CGSize = CGSize(width: 0, height: 0), shadowColor:UIColor = UIColor(red: 74.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 0.1)) {
        view.layoutIfNeeded()
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = size
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 7.0
        
    }
    
    // 截图
    func captureImage(size:CGSize) -> UIImage? {
        //CGSize(width: self.bounds.size.width, height: self.bounds.size.height-95)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
   //MARK:虚线
    //p-大小(宽高),w-宽度，s-间距,c-颜色
    func drawLine(p:CGSize,w:Int,s:Int,c:UIColor)  {
        let shape = CAShapeLayer()
        shape.bounds = .init(x: 0, y: 0, width: p.width, height: p.height)
        
        shape.position = .init(x: p.width / 2, y: p.height)
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = c.cgColor
      
        shape.lineWidth = p.height
        
        shape.lineJoin = .round
        shape.lineDashPattern = [NSNumber(value: w), NSNumber(value: s)]
        let path = CGMutablePath()
        path.move(to: .zero)
       
        path.addLine(to: .init(x:p.width, y: 0))
        shape.path = path
        self.layer.addSublayer(shape)
    }
}

extension UIView {
    
    // 设置阴影
    func showShadowLayer(style:UIView) -> CALayer {
        
        style.layoutIfNeeded()
        style.layoutSubviews()
        
        let shadowLayer0 = CALayer()
        shadowLayer0.frame = style.bounds
        shadowLayer0.shadowColor = UIColor(red: 74.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 0.1).cgColor
        shadowLayer0.shadowOpacity = 1
        shadowLayer0.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer0.shadowRadius = 8
        let shadowSize0:CGFloat = -1
        let shadowSpreadRect0 = CGRect(x: -shadowSize0, y: -shadowSize0, width: style.bounds.size.width+shadowSize0*2, height: style.bounds.size.height+shadowSize0*2)
        let shadowSpreadRadius0 =  style.layer.cornerRadius == 0 ? 0 : style.layer.cornerRadius+shadowSize0;
        let shadowPath0 = UIBezierPath(roundedRect: shadowSpreadRect0, cornerRadius: shadowSpreadRadius0)
        shadowLayer0.shadowPath = shadowPath0.cgPath;
        
        return shadowLayer0
    }
    
    func shadowLayer(target:UIView) {
        target.layoutIfNeeded()
        
        target.layer.shadowColor = UIColor(red: 74.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 0.1).cgColor
        target.layer.shadowOffset = CGSize(width: 0, height: 0)
        target.layer.shadowOpacity = 1
        target.layer.shadowRadius = target.layer.cornerRadius
    }
    
    //切角
    func cornerToView(with view : UIView, corners : UIRectCorner, size: CGSize) {
        
        let maskPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: size)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = view.bounds
        maskLayer.path = maskPath.cgPath
        view.layer.mask = maskLayer
    }
}
