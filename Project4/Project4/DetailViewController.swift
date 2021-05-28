//
//  DetailViewController.swift
//  Project4
//
//  Created by Matvey Garbuzov on 28.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var countryFlagView: UIImageView!
    
    var selectedCountry: String?
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedCountry {
            countryFlagView.image = UIImage(named: imageToLoad)
            view.backgroundColor = UIColor.systemGray6
            navigationController?.navigationBar.backgroundColor = UIColor.systemGray6
        }
        
    }
    

    

}
