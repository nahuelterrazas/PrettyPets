//
//  Constants.swift
//  PrettyPets
//
//  Created by Nahuel Terrazas on 04/08/2022.
//

import Foundation

struct Constants {
    let urlCatBreeds = "https://api.thecatapi.com/v1/breeds"
    func urlACatBreed(id: String) -> String{
        "https://api.thecatapi.com/v1/images/search?breed_ids=\(id)"
    }
}
