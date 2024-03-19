//
//  Mapper.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 18/3/24.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ViewModel {
        ViewModel(title: entity.title, overview: entity.overview, imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
