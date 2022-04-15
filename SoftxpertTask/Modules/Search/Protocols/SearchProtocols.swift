//
//  SearchProtocols.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

// view controller
// ===================================
protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData() 
}

// recipe cell view
// ===================================
protocol RecipeCellViewProtocol: AnyObject {
    func configure(viewModel: RecipeSearchViewModel)
}

// filter cell view
protocol FilterCellViewProtocol: AnyObject {
    func configure(viewModel: FilterViewModel)
}

// presenter
// ===================================
protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? { get set } // to avoid retain cycle
    var numberOfRecipes: Int { get }
    var numberOfFilters: Int { get }
    func viewDidLoad()
    func configureRecipeCell(cell: RecipeCell, indexpath: IndexPath)
    func configureFilterCell(cell: FilterCell, indexpath: IndexPath)
}

// router
// ===================================
protocol SearchRouterProtocol {}

// Interactor
// ===================================
// input
protocol SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol? { get set }
    func getRecipes(searchText: String, filter: HealthFilter)
}
 
// output
protocol SearchInteractorOutputProtocol: AnyObject {
    func recipesFetchedSuccessfully(recipes: [Recipe])
    func recipesFetchingFailed(withError error: String)
}



