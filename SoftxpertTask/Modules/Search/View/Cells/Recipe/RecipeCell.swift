//
//  RecipeCell.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit
import SDWebImage

class RecipeCell: UITableViewCell, RecipeCellViewProtocol {

    //MARK: - Outlets
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLbl: UILabel!
    @IBOutlet weak var recipeSourceLbl: UILabel!
    @IBOutlet weak var recipeHealthLbls: UILabel!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Functions
    
    func configure(viewModel: RecipeSearchViewModel) {
        recipeImageView.sd_setImage(with: viewModel.image)
        recipeTitleLbl.text = viewModel.title
        recipeSourceLbl.text = viewModel.source
        recipeHealthLbls.text = viewModel.healthLbls
    }
    
}
