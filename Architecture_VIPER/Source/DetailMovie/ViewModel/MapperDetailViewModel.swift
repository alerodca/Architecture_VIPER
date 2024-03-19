//
//  MapperDetailViewModel.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 19/3/24.
//

import Foundation

struct MapperDetailViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        .init(title: entity.title, overview: entity.overview, backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
