//
//  SearchInteractor.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    
    func getRecipes(searchText: String) {
        RecipeAPIManager.shared.getSearchResponse(searchText: searchText) { [weak self] result in
            switch result {
            case .success(let data):
                guard let hits = data?.hits else { return }
                var recipes = [Recipe]() // empty array
                
                hits.forEach { hit in recipes.append(hit.recipe) }
                self?.presenter?.recipesFetchedSuccessfully(recipes: recipes) // <<<<<< success
                
            case .failure(let error):
                self?.presenter?.recipesFetchingFailed(withError: error) // <<<<< failed
            }
        }
    }
    
    
}
