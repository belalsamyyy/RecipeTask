//
//  DetailsRouter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 16/04/2022.
//

import Foundation
import UIKit

class DetailsRouter: DetailsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(recipe: Recipe) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        
        // constructor-based dependency injection
        let presenter = DetailsPresenter(recipe: recipe, view: view, interactor: interactor, router: router)
        
        // property-based dependency injection
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
