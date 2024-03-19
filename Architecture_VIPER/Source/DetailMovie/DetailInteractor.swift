//
//  DetailInteractor.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 19/3/24.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=925480bd8081eeeecccc904bcc69f22d")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
