//
//  PetDetailViewModel.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import Foundation
import UIKit

class PetDetailsViewModel {
    
    private var service: PetDetailsService
    private var delegate: PetDetailsDelegate
    
    init(service: PetDetailsService, delegate: PetDetailsDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getImage(id: String){
        service.getBreedImage(id: id) { image in
            self.delegate.imageData(data: image.first!)
        } onError: { error in
            print("error: \(error)")
        }
    }
    
}
