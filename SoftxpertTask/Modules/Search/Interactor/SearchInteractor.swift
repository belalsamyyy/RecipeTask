//
//  SearchInteractor.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    // presneter
    weak var presenter: SearchInteractorOutputProtocol?
    
    func getRecipes(searchText: String, filter: HealthFilter) {
        RecipeAPIManager.shared.getSearchResponse(searchText: searchText, filter: filter) { [weak self] result in
            switch result {
            case .success(let data):
                guard let hits = data?.hits else { return }
                guard let next = data?._links.next.href else { return }
                var recipes = [Recipe]() // empty array
                
                hits.forEach { hit in recipes.append(hit.recipe) }
                self?.presenter?.recipesFetchedSuccessfully(recipes: recipes, next: next) // <<<<<< success
                
            case .failure(let error):
                self?.presenter?.recipesFetchingFailed(withError: error) // <<<<< failed
            }
        }
    }
    
    func getMoreRecipes(next: String) {
        RecipeAPIManager.shared.getMoreRecipes(url: next) { [weak self] result in
            switch result {
            case .success(let data):
                
                guard let hits = data?.hits else { return }
                guard let next = data?._links.next.href else { return }
                var recipes = [Recipe]() // empty array
                
                hits.forEach { hit in recipes.append(hit.recipe) }
                self?.presenter?.recipesFetchedSuccessfully(recipes: recipes, next: next) // <<<<<< success
                
            case .failure(let error):
                self?.presenter?.recipesFetchingFailed(withError: error) // <<<<< failed
            }
        }
    }
    
}
