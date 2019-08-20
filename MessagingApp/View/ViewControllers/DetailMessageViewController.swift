//
//  DetailMessageViewController.swift
//  MessagingApp
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit

class DetailMessageViewController: UIViewController {
    
    private var data: [MessagingAppDataModel]
    private var indexPath: IndexPath
    
    init(data: [MessagingAppDataModel], indexPath: IndexPath){
        self.data = data
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let textMessage: UITextView = {
        let text = UITextView()
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 18)
        text.backgroundColor = .gray
        return text
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(DetailedTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEND", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(textMessage)
        view.addSubview(tableView)
        view.addSubview(sendButton)
        nameLabel.text = data[indexPath.row].name
        setUpViews()
        sendButton.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
    }
    
    @objc func tapSendButton(){
        if let textMessage = self.textMessage.text, textMessage.count >= 1 {
            data[indexPath.row].textMessage.append(TextMessage(text: textMessage, receivedMessage: false))
            tableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        nameLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        tableView.snp.makeConstraints{make in
            make.topMargin.equalTo(nameLabel.snp_bottom).offset(30)
            make.width.equalToSuperview()
            make.bottomMargin.equalToSuperview().inset(400)
        }
        
        textMessage.snp.makeConstraints{make in
            make.bottomMargin.equalToSuperview().inset(120)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(80)
            make.height.width.equalTo(100)
        }
        
        sendButton.snp.makeConstraints{make in
            make.bottomMargin.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.width.equalTo(60)
        }
    }
}

extension DetailMessageViewController: UITableViewDelegate{
}

extension DetailMessageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[indexPath.row].textMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = data[self.indexPath.row].textMessage[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! DetailedTableViewCell
        cell.setLabelorientation(message: message)
        return cell
    }
    
}
