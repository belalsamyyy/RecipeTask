//
//  SearchRouter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        let interactor = SearchInteractor()
        let router = SearchRouter()
        
        // constructor-based dependency injection
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        
        // property-based dependency injection
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
