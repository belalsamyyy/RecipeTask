//
//  UICollectionView+Extensions.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell  {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else  {
            fatalError("Error in dequeue extension code !")
        }
        return cell
    }
    
    func size(rows: CGFloat, columns: CGFloat, spacing: CGFloat = 10) -> CGSize {
        let width = ( self.frame.width - ( columns * spacing ) - spacing ) / columns //  horizontal spacing
        let height = ( self.frame.height - ( rows * spacing ) - spacing ) / rows // vertical spacing
        return CGSize(width: max(CGFloat.leastNonzeroMagnitude, width), height: max(CGFloat.leastNonzeroMagnitude, height))
    }
}
