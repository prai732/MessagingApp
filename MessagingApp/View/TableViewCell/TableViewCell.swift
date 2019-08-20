//
//  File.swift
//  MessagingApp
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TableViewCell: UITableViewCell{
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let textMessage: UITextView = {
        let text = UITextView()
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 18)
        text.textColor = .gray
        text.isEditable = false
        text.isSelectable = false
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(textMessage)
        setUpViews()
    }
    
    func setUpViews() {
        nameLabel.snp.makeConstraints{make in
            make.topMargin.equalToSuperview().offset(20)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(100)
            
        }
        
        textMessage.snp.makeConstraints{make in
            make.topMargin.equalTo(nameLabel.snp_bottom).offset(10)
            make.height.equalTo(28)
            make.width.equalTo(300)
            make.leading.equalTo(nameLabel)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
