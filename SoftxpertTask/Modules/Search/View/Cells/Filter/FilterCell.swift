//
//  FilterCell.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import UIKit

class FilterCell: UICollectionViewCell, FilterCellViewProtocol {
    
    //MARK: - Outlets
    
    @IBOutlet weak var filterLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(viewModel: FilterViewModel) {
        filterLbl.text = viewModel.name
    }
}
