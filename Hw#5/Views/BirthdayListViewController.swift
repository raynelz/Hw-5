//
//  BirthdayListViewController.swift
//  Hw#5
//
//  Created by Захар Литвинчук on 05.11.2023.
//

import UIKit

class BirthdayListViewController: UIViewController {
    //MARK: - UI Elements
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Passed!"
        label.textColor = .systemCyan
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        return label
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(testLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
