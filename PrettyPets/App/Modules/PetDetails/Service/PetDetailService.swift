//
//  PetDetailService.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import Foundation
class PetDetailsService {
    
    func getBreedImage(id: String, onComplete: @escaping ([BreedImageDTO]) -> Void,
                     onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: Constants().urlACatBreed(id: id)) { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let breedResponse = try decoder.decode([BreedImageDTO].self, from: data)
                        onComplete(breedResponse)
                    }
                    
                } catch {
                    onError("fallo la conversión del json")
                }
            case .failure(_):
                onError("Fallo en el apimanager")
            }
            
        }
        
        
    }
    
}

