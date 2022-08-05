//
//  BreedsListViewModel.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import Foundation

class BreedsListViewModel {
    
    private var service: BreedsListService
    private var delegate: BreedsListDelegate
     var breeds = [BreedsDTO]()
    
    init(service: BreedsListService, delegate: BreedsListDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getBreeds(){
        
        service.getBreeds { breed in
            self.breeds = breed
            self.delegate.reloadTable()
        } onError: { error in
            self.delegate.showError(error: error)
        }

    }
    
    func breedsCount() -> Int{
        breeds.count
    }
    
    func getABreed(at index: Int) -> BreedsDTO {
        return breeds[index]
    }
}
