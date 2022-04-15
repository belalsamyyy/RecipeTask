//
//  SearchVC.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit

class SearchVC: UIViewController, SearchViewProtocol {

    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var suggestionTableView: UITableView!
    
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var recipesTableView: UITableView!
    
    @IBOutlet weak var noRecipesLbl: UILabel!
    
    @IBOutlet weak var recipesActivityIndicator: UIActivityIndicatorView!
    
    
    
    //MARK: - Presenter
    var presenter: SearchPresenterProtocol!

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableViews()
        setupCollectionView()
        setupSearchBar()
        presenter?.viewDidLoad()
    }
    
    //MARK: - Functions
    
    // Loading Indicator
    func showLoadingIndicator() {
        // should show loading indicator ...
        recipesActivityIndicator.isHidden = false
        recipesActivityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        // should hide loading indicator ...
        recipesActivityIndicator.stopAnimating()
        recipesActivityIndicator.isHidden = true
    }
    
    func reloadData() {
        recipesTableView.reloadData()
    }

}





