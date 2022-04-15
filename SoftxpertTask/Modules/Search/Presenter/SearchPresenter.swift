//
//  SearchPresenter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol, SearchInteractorOutputProtocol {
    
    //MARK: - Variables
    
    weak var view: SearchViewProtocol? // to avoid retain cycle
    private let interactor: SearchInteractorInputProtocol
    private let router: SearchRouterProtocol
    
    // recipes
    private var recipes = [Recipe]()
    var numberOfRows: Int {
        return recipes.count
    }
    
    //MARK: - Constructor
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Functions
    
    func viewDidLoad() {
        print("ViewDidLoad from Presenter ...")
        view?.showLoadingIndicator()
        interactor.getRecipes(searchText: "chicken")
    }
    
    func recipesFetchedSuccessfully(recipes: [Recipe]) {
        // success
        view?.hideLoadingIndicator()
        self.recipes.append(contentsOf: recipes)
        view?.reloadData()
    }
    
    func recipesFetchingFailed(withError error: String) {
        // failure - should show alert
        view?.hideLoadingIndicator()
    }
    
    func configure(cell: RecipeCell, indexpath: IndexPath) {
        let recipe = recipes[indexpath.row]
        let viewModel = RecipeSearchViewModel(recipe: recipe)
        cell.configure(viewModel: viewModel)
    }
    
}
