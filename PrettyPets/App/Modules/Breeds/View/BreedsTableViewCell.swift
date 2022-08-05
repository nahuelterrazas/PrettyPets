//
//  BreedsTableViewCell.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import UIKit

class BreedsTableViewCell: UITableViewCell {
    
    var breed: String? {
        didSet{
            breedLabel.text = breed
        }
    }
    
    var id: String?
    
    var petDescription: String?
    
    private lazy var breedLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            breedLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            breedLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            breedLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            breedLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    

    
    
}
