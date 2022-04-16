//
//  SuggestionCell.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit

class SuggestionCell: UITableViewCell, SuggestionCellViewProtocol {

    //MARK: - Outlets
    
    @IBOutlet weak var suggestionLbl: UILabel!
    
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

    func configure(viewModel: SuggestionViewModel) {
        suggestionLbl.text = viewModel.name
    }
    
}
