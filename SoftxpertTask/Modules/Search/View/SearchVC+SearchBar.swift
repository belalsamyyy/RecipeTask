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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        suggestionTableView.isHidden = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button tapped ... ")
        searchBar.resignFirstResponder()
        suggestionTableView.isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let isValid = text.isOnlyEnglishAndWhiteSpaces && !text.isEmpty
        return isValid
    }
}

