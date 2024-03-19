//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 18/3/24.
//

import Foundation

protocol LisOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: LisOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=925480bd8081eeeecccc904bcc69f22d")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: LisOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Alerodca", overview: "Aprendiendo Swift", imageURL: "", votes: 10),
            .init(id: 0, title: "Alerodca", overview: "Aprendiendo VIPER", imageURL: "", votes: 10),
            .init(id: 0, title: "Alerodca", overview: "Aprendiendo UIKit", imageURL: "", votes: 10),
            .init(id: 0, title: "Alerodca", overview: "Aprendiendo Xcode", imageURL: "", votes: 10),
            .init(id: 0, title: "Alerodca", overview: "Aprendiendo Firebase", imageURL: "", votes: 10)
        ])
    }
    
    
}
