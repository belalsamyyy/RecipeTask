//
//  DetailsVC.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit

class DetailsVC: UIViewController, DetailsViewProtocol {
    
    //MARK: - Outlets
    
    //MARK: - Presenter
    var presenter: DetailsPresenterProtocol!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }
    
}
