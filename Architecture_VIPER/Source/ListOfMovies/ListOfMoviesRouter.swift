//
//  ListOfMoviesRouter.swift
//  Architecture_VIPER
//
//  Created by Alejandro Rodríguez Cañete on 18/3/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject {
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    var detailRouter: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else { return }
        detailRouter?.showDetail(fromViewController: fromViewController, withMovieId: movieId)
    }
    
    func showListOfMovies(window: UIWindow?) {
        self.detailRouter = DetailRouter()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor, router: self)
        
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        presenter.ui = listOfMoviesView
        
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
}
