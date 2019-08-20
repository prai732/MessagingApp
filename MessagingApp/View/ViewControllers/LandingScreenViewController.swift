//
//  LandingScreenViewController.swift
//  MessagingApp
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit

class LandingScreenViewController: UIViewController {
    
    let data: [MessagingAppDataModel]
    weak var delegate: LandingScreenViewControllerDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let messagingAppLabel: UILabel = {
        let label = UILabel()
        label.text = "Messaging App"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(messagingAppLabel)
        view.addSubview(tableView)
        setUpViews()
    }
    
    init(data: [MessagingAppDataModel]){
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    func setUpViews(){
        messagingAppLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalToSuperview().inset(40)
        }
        
        tableView.snp.makeConstraints{make in
            make.topMargin.equalTo(messagingAppLabel.snp_bottom).offset(30)
            make.width.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LandingScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.loadData(name: data, indexPath: indexPath)
    }
}

extension LandingScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        cell.nameLabel.text = data[indexPath.row].name
        var message = data[indexPath.row].textMessage[0]
        cell.textMessage.text = message.text
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
}
    
}

protocol LandingScreenViewControllerDelegate: class{
    func loadData(name: [MessagingAppDataModel], indexPath: IndexPath)
}

