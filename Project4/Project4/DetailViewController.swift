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
    //@IBOutlet var nameCountry: UITextField!
    
    var selectedCountry: String?
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.isTranslucent = true
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true
        if let imageToLoad = selectedCountry {
            countryFlagView.image = UIImage(named: imageToLoad)
            
            let lightBlure = UIBlurEffect(style: .regular) // .prominent
            let effectView = UIVisualEffectView(effect: lightBlure)
            
            effectView.frame = countryFlagView.bounds
            effectView.alpha = 0.6
            
            countryFlagView.addSubview(effectView)
            //countryFlagView.layer.borderWidth = 1
            //countryFlagView.layer.borderColor = UIColor.blue.cgColor
            countryFlagView.layer.cornerRadius = 10
//            countryFlagView.clipsToBounds = true
            view.backgroundColor = UIColor.systemGray6
        }
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.hidesBarsOnTap = true
//
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.hidesBarsOnTap = false
//    }
    

    

}
