//
//  DetailsVC.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController, DetailsViewProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var recipeDetailsImageView: UIImageView!
    @IBOutlet weak var recipeDetailsTitleLbl: UILabel!
    @IBOutlet weak var recipeDetailsIngredientsLbl: UILabel!
    @IBOutlet weak var recipeWebsiteBtn: UIButton!
    
    //MARK: - Presenter
    var presenter: DetailsPresenterProtocol!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }
    
    //MARK: - Functions
    
    func setupViews() {
        recipeDetailsImageView.sd_setImage(with: presenter.recipeViewModel?.image)
        recipeDetailsTitleLbl.text = presenter.recipeViewModel?.title
        recipeDetailsIngredientsLbl.text = presenter.recipeViewModel?.ingredientLines
    }
    
    //MARK: - Actions
    
    @IBAction func recipeWebsiteBtnTapped(_ sender: Any) {
        //
    }
    
    
}
