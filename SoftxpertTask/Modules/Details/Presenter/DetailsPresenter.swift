//
//  DetailsPresenter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 16/04/2022.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol, DetailsInteractorOutputProtocol {
    
    //MARK: - Variables

    weak var view: DetailsViewProtocol?
    private let interactor: DetailsInteractorInputProtocol
    private let router: DetailsRouterProtocol
    
    // recipe
    var recipeViewModel: RecipeDetailsViewModel?

    //MARK: - Init
    
    init(recipe: Recipe, view: DetailsViewProtocol, interactor: DetailsInteractorInputProtocol, router: DetailsRouterProtocol) {
        self.recipeViewModel = RecipeDetailsViewModel(recipe: recipe)
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Functions
    
    func viewDidLoad() {
        print("viewDidLoad from presenter ...")
        print(">>> \(recipeViewModel?.title)")
    }
    
}
