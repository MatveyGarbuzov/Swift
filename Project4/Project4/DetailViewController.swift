//
//  DetailViewController.swift
//  Project4
//
//  Created by Matvey Garbuzov on 28.05.2021.
//

import UIKit
import CoreImage.CIFilterBuiltins

class DetailViewController: UIViewController {
    @IBOutlet var countryFlagView: UIImageView!
    
    var selectedCountry: String?
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedCountry {
            countryFlagView.image = UIImage(named: imageToLoad)
            
            let lightBlure = UIBlurEffect(style: .regular) // .prominent
            let effectView = UIVisualEffectView(effect: lightBlure)
            
            effectView.frame = countryFlagView.bounds
            effectView.alpha = 0.4
            
            countryFlagView.addSubview(effectView)
            //countryFlagView.layer.borderWidth = 1
            //countryFlagView.layer.borderColor = UIColor.blue.cgColor
            countryFlagView.layer.cornerRadius = 10
//            countryFlagView.clipsToBounds = true
            view.backgroundColor = UIColor.systemGray6
            navigationController?.navigationBar.backgroundColor = UIColor.systemGray6
        }
        
    }
    

    

}
