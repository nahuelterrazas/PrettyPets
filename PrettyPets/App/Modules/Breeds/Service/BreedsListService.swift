//
//  BreedsListService.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import Foundation
class BreedsListService {
    
    func getBreeds(onComplete: @escaping ([BreedsDTO]) -> Void,
                     onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: Constants().urlCatBreeds) { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let breedResponse = try decoder.decode([BreedsDTO].self, from: data)
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

