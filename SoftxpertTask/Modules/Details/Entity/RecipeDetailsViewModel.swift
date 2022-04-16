//
//  RecipeDetailsViewModel.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 16/04/2022.
//

import Foundation

struct RecipeDetailsViewModel {
    var image: URL?
    var title: String?
    var url: String?
    var ingredientLines: String?
    
    init(recipe: Recipe) {
        image = URL(string: recipe.image ?? "")
        title = recipe.label
        url = recipe.url
        ingredientLines = returnIngredientsLines(for: recipe)
    }
    
    func returnIngredientsLines(for recipe: Recipe) -> String {
        var string = ""
        recipe.ingredientLines?.forEach({ ingredient in
            string += "\(ingredient)\n"
        })
        return string
    }
}
