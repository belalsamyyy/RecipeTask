//
//  DetailsProtocols.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 16/04/2022.
//

import Foundation
import UIKit

// view
// ===================================
protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol! { get set }
}

// presenter
// ===================================
protocol DetailsPresenterProtocol: AnyObject {
    var view: DetailsViewProtocol? { get set } // to avoid retain cycle
    var recipeViewModel: RecipeDetailsViewModel? { get }
    func viewDidLoad()
}

// router
// ===================================
protocol DetailsRouterProtocol {}

// Interactor
// ===================================
// input
protocol DetailsInteractorInputProtocol {
    var presenter: DetailsInteractorOutputProtocol? { get set }
}
 
// output
protocol DetailsInteractorOutputProtocol: AnyObject {}
