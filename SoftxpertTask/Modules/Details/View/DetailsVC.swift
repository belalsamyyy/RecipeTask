//
//  DetailsVC.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

class DetailsVC: UIViewController, DetailsViewProtocol, SFSafariViewControllerDelegate {
    
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
    
    func setupNavBar() {
        // Navigation right Button
        let shareImage = UIImage(named: "icon-share")
        let shareBtn = UIBarButtonItem(image: shareImage,style: .plain, target: self, action: #selector(handleShareBtnTapped))
        navigationItem.rightBarButtonItem = shareBtn
    }
    
    //MARK: - Actions
    
    @objc func handleShareBtnTapped() {
        print("share btn tapped ...")
        let items = [URL(string: presenter.recipeViewModel?.url ?? "")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @IBAction func recipeWebsiteBtnTapped(_ sender: Any) {
        let urlString = presenter.recipeViewModel?.url ?? ""
        if let url = URL(string: urlString) {
            let configuration = SFSafariViewController.Configuration()
            configuration.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: configuration)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
}
