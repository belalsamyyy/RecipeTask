//
//  SearchVC+TableViews.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import UIKit

// Table Views
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableViews() {
        // suggestions
        suggestionTableView.delegate = self
        suggestionTableView.dataSource = self
        suggestionTableView.register(cell: SuggestionCell.self)
                
        // recipes
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
        recipesTableView.register(cell: RecipeCell.self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case suggestionTableView:
            return 2
        case recipesTableView:
            return presenter.numberOfRows
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case suggestionTableView:
            let cell = tableView.dequeue() as SuggestionCell
            return cell
            
        case recipesTableView:
            let cell = tableView.dequeue() as RecipeCell
            presenter.configure(cell: cell, indexpath: indexPath)
            return cell
            
        default:
            print("default case")
            return UITableViewCell()
        }
    }
}
