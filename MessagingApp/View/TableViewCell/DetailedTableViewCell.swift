//
//  DetailedTableViewCell.swift
//  MessagingApp
//
//  Created by fordlabs on 17/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailedTableViewCell: UITableViewCell {
    let textMessage: UILabel = {
        let text = UILabel()
        text.textColor = .black
        return text
    }()
    
    var isMessagereceived: Bool = true
    
    let bubbleView = UIView()
    
    func setLabelorientation(message: TextMessage){
        textMessage.textAlignment = message.receivedMessage ? .left : .right
        bubbleView.backgroundColor = message.receivedMessage ? .yellow : .green
        textMessage.text = message.text
        if message.receivedMessage {
            bubbleView.snp.makeConstraints{make in
                make.leading.equalToSuperview().offset(16)
            }
        } else{
            bubbleView.snp.makeConstraints{make in
                make.trailing.equalToSuperview().inset(16)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textMessage.numberOfLines = 0
        addSubview(bubbleView)
        addSubview(textMessage)
        setUpViews()
    }
    
    func setUpViews() {
        bubbleView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalTo(250)
        }
        
        textMessage.snp.makeConstraints{make in
            make.top.equalTo(bubbleView.snp_top).offset(16)
            make.leading.equalTo(bubbleView).offset(16)
            make.bottom.equalTo(bubbleView).inset(16)
            make.trailing.equalTo(bubbleView).inset(16)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
