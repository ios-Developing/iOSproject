//
//  CustomTableMessageCell.swift
//  Project1
//
//  Created by Dmitry on 26/2/24.
//

import UIKit

final class CustomTableMessageCell: UITableViewCell {
    
    private var text1: UILabel = {
        let lable = UILabel()
        lable.text = "Message1"
        lable.textColor = .black
        return lable
    }()
    
    private var text2: UILabel = {
        let lable = UILabel()
        lable.text = "Message2"
        lable.textColor = .black
        lable.textAlignment = .right
        return lable
    }()
    
    private var text3: UILabel = {
        let lable = UILabel()
        lable.text = "Message3"
        lable.textColor = .black
        return lable
    }()
    
    private var message: UILabel = {
        let message = UILabel()
        message.text = "Сообщение..."
        message.textAlignment = .left
        message.textColor = .black
        message.backgroundColor = .blue
        return message
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(codrer:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(text1)
        contentView.addSubview(text2)
        contentView.addSubview(text3)
        contentView.addSubview(message)
        setupConstraints()
    }
    
    private func setupConstraints() { // установка местоположения элементов

        text1.translatesAutoresizingMaskIntoConstraints = false
        text2.translatesAutoresizingMaskIntoConstraints = false
        text3.translatesAutoresizingMaskIntoConstraints = false
        message.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            text1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            text1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  20),
            text1.heightAnchor.constraint(equalToConstant: 20),
            
            text2.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 10),
            text2.leadingAnchor.constraint(equalTo: text1.leadingAnchor),
            text2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            text3.topAnchor.constraint(equalTo: text2.bottomAnchor, constant: 10),
            text3.leadingAnchor.constraint(equalTo: text2.leadingAnchor),
            text3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            message.topAnchor.constraint(equalTo: text3.bottomAnchor, constant: 10),
            message.leadingAnchor.constraint(equalTo: text3.leadingAnchor),
            message.trailingAnchor.constraint(equalTo: text3.trailingAnchor),
            message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
}
