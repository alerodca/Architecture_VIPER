//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 18/3/24.
//

import Foundation

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel])
}

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: LisOfMoviesInteractable
    private var models: [PopularMovieEntity] = []
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouting
    
    init(listOfMoviesInteractor: LisOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
}
