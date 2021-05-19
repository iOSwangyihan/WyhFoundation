//
//  BaseTableViewCell.swift
//  PetrounHappy
//
//  Created by tongwanming on 2020/8/10.
//  Copyright © 2020 com.petroun. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = ColorName.f5F6F9.color
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func makeUI() {
        
    }
    static let indentify = "BaseTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
