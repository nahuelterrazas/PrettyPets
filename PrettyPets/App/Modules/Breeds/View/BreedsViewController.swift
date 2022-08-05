//
//  BreedsViewController.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import UIKit

protocol BreedsListDelegate{
    func reloadTable()
    func showError(error: String)
}

class BreedsViewController: UIViewController {
    
    private var service = BreedsListService()
    private var viewModel: BreedsListViewModel?
    
    private lazy var breedTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(BreedsTableViewCell.self, forCellReuseIdentifier: String(describing: BreedsTableViewCell.self))
        view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        self.viewModel = BreedsListViewModel(service: service, delegate: self)
        self.viewModel?.getBreeds()

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

extension BreedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BreedsTableViewCell

        let petVC = PetDetailsViewController()
        petVC.idCell = cell.id
        petVC.breed = cell.breed
        petVC.petDescription = cell.petDescription
        
        self.present(petVC, animated: true)
    }
}

extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.breedsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BreedsTableViewCell.self), for: indexPath) as? BreedsTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle  = .none
        let aBreed = self.viewModel?.getABreed(at: indexPath.row)
        cell.breed = aBreed?.name
        cell.id = aBreed?.id
        cell.petDescription = aBreed?.description
        return cell
    }
    
}

extension BreedsViewController: BreedsListDelegate {
    
    func reloadTable() {
        self.breedTableView.reloadData()
    }
    
    func showError(error: String) {
        print("Algo fallo: ", error)
    }

}
