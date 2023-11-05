//
//  ViewController.swift
//  Hw#5
//
//  Created by Захар Литвинчук on 05.11.2023.
//

import UIKit

class SignInViewController: UIViewController {
    //MARK: - TextField Variables
    var email: String? {
        return emailTextField.text
    }
    
    var password: String? {
        return passwordTextField.text
    }
    
    //MARK: - UI Elements
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .systemCyan
        label.textAlignment = .center
        return label
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemCyan
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemCyan
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let faceIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход по Face ID"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let faceIdSwitch: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    
    //MARK: - LoginStackView
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailLabel,emailTextField,passwordLabel,passwordTextField])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    //MARK: - SwitchStackView
    private lazy var switchStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [faceIdLabel,faceIdSwitch])
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //Switch password visiablity button
        let passwordToggleButton = UIButton(type: .custom)
        passwordToggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        passwordToggleButton.tintColor = .systemGray
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordTextField.rightView = passwordToggleButton
        passwordTextField.rightViewMode = .whileEditing
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(signInLabel)
        view.addSubview(loginStack)
        view.addSubview(switchStack)
        view.addSubview(loginButton)
        
        setConstraints()
    }
    
    //passwordViewButton
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    //loginButton
    @objc func login() {
        guard let email = email, let password = password else {
            assertionFailure("Email / password should never be nil")
            return
        }
        if email.isEmpty || password.isEmpty {
            print("Email / password cannot be blank")
            return
        } else if email == "/" && password == "/" {
            let secondViewController = BirthdayListViewController()
            navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    //MARK: - Constraints
    func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        switchStack.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //nameLabel
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            //signInLabel
            signInLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            signInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            signInLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            //loginStack
            loginStack.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            loginStack.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            loginStack.trailingAnchor.constraint(equalTo: signInLabel.trailingAnchor),
            
            //textField's height
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //switchStack
            switchStack.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 30),
            switchStack.trailingAnchor.constraint(equalTo: loginStack.trailingAnchor),
            
            //loginButton
            loginButton.topAnchor.constraint(equalTo: switchStack.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: loginStack.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginStack.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
}

