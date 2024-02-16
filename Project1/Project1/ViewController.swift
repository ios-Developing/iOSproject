//
//  ViewController.swift
//  Project1
//
//  Created by Dmitry on 11/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Мое первое приложение!"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    
    private var loginTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.font = UIFont.systemFont(ofSize: 15)
        field.backgroundColor = .white
        field.text = "Login"
        return field
    }()
    
    private var loginPasswordField: UITextField = {
        let fieldPassword = UITextField()
        fieldPassword.borderStyle = .line
        fieldPassword.font = UIFont.systemFont(ofSize: 15)
        fieldPassword.backgroundColor = .white
        fieldPassword.text = "Password"
        fieldPassword.isSecureTextEntry = true
        return fieldPassword
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .darkGray
        return button
    }()
        
    private func setupViews() {
        
        view.addSubview(label)
        view.addSubview(loginTextField)
        view.addSubview(loginPasswordField)
        view.addSubview(button)
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
            loginTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalToConstant: 200),
//            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            loginPasswordField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            loginPasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginPasswordField.widthAnchor.constraint(equalToConstant: 200),
            
            button.topAnchor.constraint(equalTo: loginPasswordField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),

            
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "First viewController"
        setupViews()
        // Do any additional setup after loading the view.
    }


}

