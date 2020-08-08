//
//  CustomCell.swift
//  EllcoTest
//
//  Created by Мурад on 07.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import UIKit


class CustomCell: UICollectionViewCell {
    
    let view = UIView()
    let nameLabel = UILabel()
    let badgeLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    let versionLabel = UILabel()
    let senderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view.backgroundColor = .white
        configureView()
        configureNameLabel()
        configureBadgeLabel()
        configureDateLabel()
        configureDescriptionLabel()
        configureVersionLable()
        configureSenderLabel()
        
        configureElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellWithValuesOf(_ ticket: Ticket) {
            self.updateUI(description: ticket.description, name: ticket.name, date: ticket.createdAt, author: ticket.sender, status: ticket.status, version: ticket.version)
    }
    
    private func updateUI(description: String?, name: String?, date: DateOf?, author: Sender?, status: Status?, version: String?) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.versionLabel.text = version
        self.senderLabel.text = author?.username
        
        if let date = date {
            let dateText = convertData(date)
            self.dateLabel.text = dateText
        }
        
        if let status = status {
            badgeLabel.text = status.description
            changeBadgeColor(status)
        }
    }
    
    func convertData(_ data: DateOf) -> String {
        let dateFormatter = DateFormatter()
        let dateIn = Date(timeIntervalSince1970: Double(data.timestamp))
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let strDate = dateFormatter.string(from: dateIn)
        return strDate
    }
    
    func changeBadgeColor(_ status: Status) {
        switch status.badge {
        case "info":
            badgeLabel.backgroundColor = .blue
        case "primary":
            badgeLabel.backgroundColor = .systemBlue
        case "success":
            badgeLabel.backgroundColor = .green
        case "danger":
            badgeLabel.backgroundColor = .red
        case "warning":
            badgeLabel.backgroundColor = .yellow
        default:
            break
        }
    }
    
    func configureView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor    = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
    
    func configureNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 1
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .black
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.addSubview(nameLabel)
    }
    
    func configureBadgeLabel() {
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.numberOfLines = 1
        badgeLabel.font = badgeLabel.font.withSize(18)
        badgeLabel.backgroundColor = .green
        badgeLabel.textColor = .black
        badgeLabel.clipsToBounds = true
        badgeLabel.layer.cornerRadius = 10
        badgeLabel.textAlignment = .center
        view.addSubview(badgeLabel)
    }
    
    func configureDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.numberOfLines = 1
        dateLabel.font = dateLabel.font.withSize(10)
        dateLabel.textColor = .lightGray
        view.addSubview(dateLabel)
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .left
        descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.addSubview(descriptionLabel)
    }
    
    func configureVersionLable() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.numberOfLines = 1
        versionLabel.font = dateLabel.font.withSize(10)
        versionLabel.textColor = .lightGray
        view.addSubview(versionLabel)
    }
    
    func configureSenderLabel() {
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        senderLabel.numberOfLines = 1
        senderLabel.font = dateLabel.font.withSize(10)
        senderLabel.textColor = .black
        view.addSubview(senderLabel)
    }
    
    
    func configureElements() {
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            badgeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            badgeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            badgeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 70),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            versionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            senderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            senderLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
}
