//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 19/3/24.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailPresenter: DetailPresentable {
    weak var ui: DetailPresenterUI?
    
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailViewModel
    
    init(movieId: String, interactor: DetailInteractable, mapper: MapperDetailViewModel) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
}
