//
//  PetDetailsViewController.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import UIKit

protocol PetDetailsDelegate {
    func imageData(data: BreedImageDTO)
    func showError(error: String)
}

class PetDetailsViewController: UIViewController {
    
    private var service = PetDetailsService()
    private var viewModel: PetDetailsViewModel?
    
    var idCell: String?
    var breed: String?
    var petDescription: String?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.text = breed
        
        view.addSubview(label)
        return label
    }()
    
    private lazy var petImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit

        view.addSubview(image)
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        label.text = petDescription
        
        view.addSubview(label)
        return label
    }()

    
    private lazy var aDollarButton: UIButton = {
        var configuration = UIButton.Configuration.borderedTinted()
        configuration.baseBackgroundColor = .black
        configuration.buttonSize = .large
        configuration.title = "$1 donation"

        let button = UIButton()
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        view.addSubview(button)
        return button
    }()
    
    private lazy var fiveDollarButton: UIButton = {
        var configuration = UIButton.Configuration.borderedTinted()
        configuration.baseBackgroundColor = .black
        configuration.buttonSize = .large
        configuration.title = "$5 donation"

        let button = UIButton()
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        setupConstraints()
        self.viewModel = PetDetailsViewModel(service: service, delegate: self)
        self.viewModel?.getImage(id: idCell ?? "")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            petImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            petImage.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            petImage.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            petImage.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: petImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            aDollarButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            aDollarButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            aDollarButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            fiveDollarButton.topAnchor.constraint(equalTo: aDollarButton.bottomAnchor, constant: 10),
            fiveDollarButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            fiveDollarButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }


}


extension PetDetailsViewController: PetDetailsDelegate {

    
    func showError(error: String) {
        print(error)

    }
    
    func imageData(data: BreedImageDTO) {
        if let url = URL(string: data.url){
            petImage.load(url: url)
        }
        
    }
    

    
}
