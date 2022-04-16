//
//  SearchPresenter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import UIKit

class SearchPresenter: SearchPresenterProtocol, SearchInteractorOutputProtocol {

    //MARK: - Variables
    
    weak var view: SearchViewProtocol? // to avoid retain cycle
    private let interactor: SearchInteractorInputProtocol
    private let router: SearchRouterProtocol
    
    // search
    var searchText: String = ""
    var suggestionsArr: [String] {
        return Defaults.suggestionsArr
    }

    // recipes
    private var recipes = [Recipe]()
    var next: String = ""
    
    var numberOfRecipes: Int {
        return recipes.count
    }
    
    // filters
    var numberOfFilters: Int {
        return HealthFilter.allCases.count
    }
        
    //MARK: - Init
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Functions
    
    func viewDidLoad() {
        print("ViewDidLoad from Presenter ...")
    }
    
    //MARK: - Recipes

    func recipesFetchedSuccessfully(recipes: [Recipe], next: String) {
        // success
        view?.hideLoadingIndicator()
        self.recipes.append(contentsOf: recipes)
        view?.reloadData()
        view?.hideNoRecipesLabel()
        // next
        self.next = next
        print("next from presenter => \(next)")
    }
    
    func recipesFetchingFailed(withError error: String) {
        // failure - should show alert
        view?.hideLoadingIndicator()
        self.recipes.removeAll()
        view?.showNoRecipesLabel()
    }
    
    
    func configureRecipeCell(cell: RecipeCell, indexpath: IndexPath) {
        let recipe = recipes[indexpath.row]
        let viewModel = RecipeSearchViewModel(recipe: recipe)
        cell.configure(viewModel: viewModel)
    }
    
    //MARK: - Filters

    func configureFilterCell(cell: FilterCell, indexpath: IndexPath) {
        let filter = HealthFilter.allCases[indexpath.row]
        let viewModel = FilterViewModel(filter: filter)
        cell.configure(viewModel: viewModel)
    }
    
    func healthFilterTapped(item: Int) {
        let selectedFilter = HealthFilter.allCases[item]
        print("=> \(selectedFilter.rawValue) tapped filter !")
        self.recipes.removeAll() // make recipes array empty
        view?.showLoadingIndicator() // show loading indicator
        interactor.getRecipes(searchText: self.searchText, filter: selectedFilter) // refetch recieps with the new filter
        view?.reloadData()
    }
    
    //MARK: - More
    
    func didWeReachToEnd(indexpath: IndexPath) {
        let lastIndex = numberOfRecipes - 1
        if indexpath.row == lastIndex {
            print("we reach to the end")
            interactor.getMoreRecipes(next: next)
        }
    }
    
    //MARK: - Search Bar
    
    func searchBtnTapped(searchText: String) {
        self.searchText = searchText
        
        self.recipes.removeAll()
        view?.showLoadingIndicator()
        interactor.getRecipes(searchText: self.searchText, filter: .ALL)
        
        if Defaults.suggestionsArr.count == 10 {
            Defaults.suggestionsArr.remove(at: 0)
        }
        
        Defaults.suggestionsArr.append(searchText)
    }
    
    //MARK: - Suggestions
    
    func configureSuggestionCell(cell: SuggestionCell, indexpath: IndexPath) {
        let suggestion = suggestionsArr[indexpath.row]
        let viewModel = SuggestionViewModel(suggestion: suggestion)
        cell.configure(viewModel: viewModel)
    }
    
    func suggestionCellTapped(indexpath: IndexPath) {
        let suggestion = Defaults.suggestionsArr[indexpath.row]
        view?.setSearchBarText(text: suggestion)
        view?.hideSuggestionList()
        
        self.searchText = suggestion
        self.recipes.removeAll()
        view?.showLoadingIndicator()
        interactor.getRecipes(searchText: suggestion, filter: .ALL)
    }
    
    //MARK: - Details
    
    func showDetails(indexpath: IndexPath) {
        let recipe = self.recipes[indexpath.row]
        router.pushToDetailsView(recipe: recipe)
    }
}
