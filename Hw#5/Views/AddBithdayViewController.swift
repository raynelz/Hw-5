//
//  AddBithdayViewController.swift
//  Hw#5
//
//  Created by Захар Литвинчук on 06.11.2023.
//

import UIKit

class AddBithdayViewController: UIViewController {
    var delegate: AddBirthdayDelegate?
    
    //MARK: - UI Elements
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .systemCyan
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите имя"
        return textField
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textColor = .systemCyan
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите описание"
        return textField
    }()
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Создание кнопки "Отменить"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        // Создание кнопки "Сохранить"
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        
        // Установка кнопок на navigationItem
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        
        setConstraints()
    }
    
    //cancelButtonTapped
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    //saveButtonTapped
    @objc func saveButtonTapped() {
        delegate?.addBirthday(name: nameTextField.text ?? "Пусто", description: descriptionTextField.text ?? "Пусто")
        dismiss(animated: true)
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //nameLabel
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            nameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            
            //nameTextField
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            nameTextField.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            
            //descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            descriptionLabel.leftAnchor.constraint(equalTo: nameTextField.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            
            //descriptionTextField
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            descriptionTextField.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor),
            descriptionTextField.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor)
        ])
    }
}

protocol AddBirthdayDelegate {
    func addBirthday(name: String, description: String)
}
