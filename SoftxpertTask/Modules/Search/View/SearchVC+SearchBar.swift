//
//  SearchVC+SearchBar.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import UIKit

extension SearchVC: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.delegate = self 
    }

    // delegate functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.view?.showSuggestionList()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter.view?.showSuggestionList()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button tapped ... ")
        presenter.view?.hideSuggestionList()
        
        guard let searchText = searchBar.text else { return }
        presenter.searchBtnTapped(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.view?.hideSuggestionList()
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let isValid = text.isOnlyEnglishAndWhiteSpaces && !text.isEmpty
        return isValid
    }
}

