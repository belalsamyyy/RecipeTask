//
//  Recipe.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import Foundation

struct SearchResponse: Codable {
    var from: Int
    var to: Int
    var count: Int
    var _links: Link
    var hits: [Hit]
}

struct Link: Codable {
    var next: Next
}

struct Next: Codable {
    var href: String
}

struct Hit: Codable {
    var recipe: Recipe
}

struct Recipe: Codable {
    // search
    var image: String?
    var label: String?
    var source: String?
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
