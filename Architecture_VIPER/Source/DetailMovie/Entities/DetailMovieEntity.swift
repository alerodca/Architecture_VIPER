//
//  DetailMovieEntity.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 19/3/24.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
