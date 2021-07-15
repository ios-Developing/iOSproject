//
//  LoginViewControl.swift
//  VK PLUS
//
//  Created by Dmitry on 10.07.2021.
//

import UIKit

final class LoginViewControl: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        let navbar = navigationController?.navigationBar
        //        navbar?.isHidden = true
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func backtoLoginScreen(_ segue: UIStoryboardSegue) {
        //        if let loginController = segue.destination as? LoginViewControl {
        //            let sourseController = segue.source
        //            loginController.view.backgroundColor = sourseController.view.backgroundColor
        //        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "allPersonsTabBarController" {
            //  получаем текст логина
            guard
                let login = loginTextField.text,
                let password = passwordTextField.text
            else {
                showErrorAlert(message: "Поля не заполнены")
                print("Login or password equal nil")
                return false
            }
            
            // Проверяем, верны ли они
            if login == "1" && password == "1" {
                print("успешная авторизация")
                return true
            } else {
                showErrorAlert(message: "Не верный логин или пароль")
                print("неуспешная авторизация")
                return false
            }
        }
        showErrorAlert(message: "Не верный identifier segue")
        return false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Отписываемся от уведомлений о клавиатуре
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        print("Login button pressed")
    }
    
    // Когда клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc private func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    private func setViews() {
        loginLabel.text = "Логин"
        passwordLabel.text = "Пароль"
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .init(red: 75/255.0, green: 92/255.0, blue: 148/255.0, alpha: 1)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) {_ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
