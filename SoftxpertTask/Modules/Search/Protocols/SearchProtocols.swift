//
//  SearchProtocols.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import UIKit

// view controller
// ===================================
protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNoRecipesLabel()
    func hideNoRecipesLabel()
    
    func showSuggestionList()
    func hideSuggestionList()
    
    func setSearchBarText(text: String)
    
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

// suggestion cell view
protocol SuggestionCellViewProtocol: AnyObject {
    func configure(viewModel: SuggestionViewModel)
}

// presenter
// ===================================
protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? { get set } // to avoid retain cycle
    var searchText: String { get }
    var suggestionsArr: [String] { get }
    var numberOfRecipes: Int { get }
    var numberOfFilters: Int { get }
    var next: String { get }
    
    func viewDidLoad()
    func configureRecipeCell(cell: RecipeCell, indexpath: IndexPath)
    func configureFilterCell(cell: FilterCell, indexpath: IndexPath)
    func configureSuggestionCell(cell: SuggestionCell, indexpath: IndexPath)
    
    func healthFilterTapped(item: Int)
    func didWeReachToEnd(indexpath: IndexPath)
    func searchBtnTapped(searchText: String)
    func suggestionCellTapped(indexpath: IndexPath)
}

// router
// ===================================
protocol SearchRouterProtocol {
    func pushToDetailsView(navigationController: UINavigationController)
}

// Interactor
// ===================================
// input
protocol SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol? { get set }
    func getRecipes(searchText: String, filter: HealthFilter)
    func getMoreRecipes(next: String)
}
 
// output
protocol SearchInteractorOutputProtocol: AnyObject {
    func recipesFetchedSuccessfully(recipes: [Recipe], next: String)
    func recipesFetchingFailed(withError error: String)
}



