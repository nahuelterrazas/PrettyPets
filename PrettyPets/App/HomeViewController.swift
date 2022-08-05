//
//  ViewController.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pretty Pets 🤍"
        label.textColor = .white
        label.font = .systemFont(ofSize: 32)
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    
    private lazy var missionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Help an anonymous pet to buy a new toy, scraper, some clothing or even a new place to rest. Even a dollar can make a difference!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 0
        view.addSubview(label)
        return label
    }()
    
    private lazy var petsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        view.addSubview(stackView)
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupAnimalButtons()
    }

    private func setupView() {
        view.backgroundColor = .systemBlue
    }
    
    private func setupAnimalButtons() {
        let PetBreedListVC = BreedsViewController()
        ["cat"].forEach { pet in
            let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
                self.navigationController?.pushViewController(PetBreedListVC, animated: true)}))
            var configuration = UIButton.Configuration.borderedTinted()
            configuration.title = "Help a \(pet)"
            configuration.image = UIImage(systemName: "pawprint.fill")
            configuration.imagePadding = 5
            configuration.baseBackgroundColor = .black
            configuration.buttonSize = .large
            
            button.configuration = configuration
            button.tintColor = .white
            
            petsStackView.addArrangedSubview(button)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            appTitleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            appTitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        
            missionLabel.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 40),
            missionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            missionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        
            petsStackView.topAnchor.constraint(equalTo: missionLabel.bottomAnchor, constant: 40),
            petsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            petsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            
        ])
    }
    

}
