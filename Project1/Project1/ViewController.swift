//
//  ViewController.swift
//  Project1
//
//  Created by Dmitry on 11/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageView = UIImageView(image: UIImage(named: "myApp.jpg"))

    private var label: UILabel = {
        let label = UILabel()
        label.text = "Мое первое приложение!"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .blue
        return label
    }()
    
    private var loginTextField: UITextField = {
        var field = UITextField()
        field.borderStyle = .line
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = .black
        field.backgroundColor = .white
        field.text = "Login"
        return field
    }()
    
    private var loginPasswordField: UITextField = {
        var fieldPassword = UITextField()
        fieldPassword.borderStyle = .line
        fieldPassword.font = UIFont.systemFont(ofSize: 15)
        fieldPassword.textColor = .black
        fieldPassword.backgroundColor = .white
        fieldPassword.text = "Password"
        fieldPassword.isSecureTextEntry = true
        return fieldPassword
    }()
    
    private var button: UIButton = {
        
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        title = "Main"
        setupViews()
        // Do any additional setup after loading the view.
    }

    private func setupViews() {
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginTextField)
        view.addSubview(loginPasswordField)
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/4 ),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
             
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            
            loginTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginPasswordField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            loginPasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginPasswordField.widthAnchor.constraint(equalToConstant: 200),
            
            button.topAnchor.constraint(equalTo: loginPasswordField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}

private extension ViewController {
    @objc func tap() {
        navigationController?.pushViewController(TableViewUsers(), animated: true)
    }
}
