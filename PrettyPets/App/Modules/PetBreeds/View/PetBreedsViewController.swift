//
//  PetBreedsViewController.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import UIKit

class PetBreedsViewController: UIViewController {
        
    private lazy var breedTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Breeds"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            breedTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            breedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            breedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            breedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PetBreedsViewController: UITableViewDelegate {
}

extension PetBreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle  = .none

        cell.textLabel?.text = "Cell \(indexPath.row+1)"
        return cell
    }
    
}
