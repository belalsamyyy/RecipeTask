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
        recipesActivityIndicator.isHidden = true
    }
    
    //MARK: - Functions
    
    func reloadData() {
        recipesTableView.reloadData()
        suggestionTableView.reloadData()
    }
    
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
    
    // no recipes label
    func showNoRecipesLabel() {
        noRecipesLbl.isHidden = false
    }
    
    func hideNoRecipesLabel() {
        noRecipesLbl.isHidden = true
    }
    
    // suggestion list 
    func showSuggestionList() {
        suggestionTableView.isHidden = false
    }
    
    func hideSuggestionList() {
        searchBar.resignFirstResponder()
        suggestionTableView.isHidden = true
    }
    
    func setSearchBarText(text: String) {
        searchBar.text = text
    }
}





