//
//  RecipeViewModel.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

struct RecipeSearchViewModel {
    var image: URL?
    var title: String?
    var source: String?
    var healthLbls: String?
        
    init(recipe: Recipe) {
        image = URL(string: recipe.image ?? "")
        title = recipe.label
        source = recipe.source
        healthLbls = returnHealthLbls(for: recipe)
    }
    
    func returnHealthLbls(for recipe: Recipe) -> String {
        var string = ""
        recipe.healthLabels?.forEach({ label in
            string += "\(label),"
        })
        return string
    }
}
