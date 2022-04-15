//
//  Recipe.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    var from, to, count: Int
    var _links: Links
    var hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    var recipe: Recipe
}

// MARK: - Links
struct Links: Codable {
    var next: Next
}

// MARK: - Next

// search response -> _links -> next
struct Next: Codable {
    var href: String
}

// MARK: - Recipe

// search response -> hits -> recipe
struct Recipe: Codable {
    // search
    var image, label, source: String?
    var healthLabels: [String]?
    // details
    var ingredientLines: [String]?
    var url: String?
    var shareAs: String?
    
    enum Codingkeys: String, CodingKey {
        case image = "image"
        case label = "label"
        case source = "source"
        case healthLabels = "healthLabels"
        case ingredientLines = "ingredientLines"
        case url = "url"
        case shareAs = "shareAs"
    }
}
