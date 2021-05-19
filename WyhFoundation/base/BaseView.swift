//
//  BaseView.swift
//  PetrounHappy
//
//  Created by gt001 on 2020/8/12.
//  Copyright © 2020 com.petroun. All rights reserved.
//

import UIKit

class BaseView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
