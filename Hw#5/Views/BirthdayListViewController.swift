//
//  BirthdayListViewController.swift
//  Hw#5
//
//  Created by Захар Литвинчук on 05.11.2023.
//

import UIKit

class BirthdayListViewController: UIViewController, AddBirthdayDelegate {
    //MARK: - UI Elements
    private let tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        return table
    }()
    
    var birthdayItems: [BirthdayItem] = [
        BirthdayItem(name: "Zahar", description: "Some sample text, ok, da?"),
        BirthdayItem(name: "Kate", description: "Has birthday today")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Birthday"
        
        //plusButton
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapPlusButton))
        navigationItem.rightBarButtonItem = plusButton
        
        tableView.register(BirthdaysTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        setConstraints()
    }
    
    @objc func didTapPlusButton() {
        let addBirthdayVC = AddBithdayViewController()
        addBirthdayVC.delegate = self
        let navController = UINavigationController(rootViewController: addBirthdayVC)
        present(navController, animated: true)
    }
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //tableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addBirthday(name: String, description: String) {
        let newItem = BirthdayItem(name: name, description: description)
        birthdayItems.append(newItem)
        tableView.reloadData()
    }
}

extension BirthdayListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdayItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BirthdaysTableViewCell else {
            fatalError("Issue dequeuing cell of type MyTableViewCell")
        }
        
        let birthdayItem = birthdayItems[indexPath.row]
        cell.configure(with: birthdayItem)
        return cell
    }
    
    
}

//MARK: - MyTableViewCell
class BirthdaysTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let iconImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Configure the image view to use the system icon
        iconImageView.image = UIImage(systemName: "person.circle.fill")
        iconImageView.contentMode = .scaleAspectFit // to keep the image aspect ratio

        // Add subviews
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(iconImageView)

        // Disable autoresizing masks
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        // Set up constraints for the icon image view and other labels
        NSLayoutConstraint.activate([
            //iconImageView
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),

            //nameLabel
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            //descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: BirthdayItem) {
        nameLabel.text = item.name
        descriptionLabel.text = item.description
    }
}


