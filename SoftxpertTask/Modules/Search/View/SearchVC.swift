//
//  SearchVC.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit

class SearchVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var suggestionTableView: UITableView!
    
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var recipesTableView: UITableView!
    
    @IBOutlet weak var noRecipesLbl: UILabel!
    
    //MARK: - Variables
    
    
    //MARK: - Constants


    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    //MARK: - Functions
    
    fileprivate func setupViews() {
        // suggestions
        suggestionTableView.delegate = self
        suggestionTableView.dataSource = self
        suggestionTableView.register(cell: SuggestionCell.self)
        
        // filters
        filtersCollectionView.delegate = self
        filtersCollectionView.dataSource = self
        filtersCollectionView.register(cell: FilterCell.self)
        filtersCollectionView.backgroundColor = .white
        
        // recipes
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
        recipesTableView.register(cell: RecipeCell.self)
    }

    
    //MARK: - Actions

}

//MARK: - Extensions

// Table Views
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case suggestionTableView:
            return 2
        case recipesTableView:
            return 10
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
            return cell
        default:
            print("default case")
            return UITableViewCell()
        }
    }
}


// Collection Views
extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as FilterCell
        return cell
    }
}


extension SearchVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // horizontal spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.size(rows: 1, columns: 2.5)
    }
    
}
