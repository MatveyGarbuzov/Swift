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
    @IBOutlet var nameCountry: UITextView!
    //@IBOutlet var nameCountry: UITextField!
    
    var selectedCountry: String?
    var selectedCountryName: String?
    //var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.hidesBarsOnSwipe = true
       CountryFullInfo()
//        nameCountry.isEditable = false
//        nameCountry.text = "Country: \(selectedCountryName!)\n"
//        nameCountry.text += "Population: "
        
        if let imageToLoad = selectedCountry {
            countryFlagView.image = UIImage(named: imageToLoad)
            
            let lightBlure = UIBlurEffect(style: .regular) // .prominent
            let effectView = UIVisualEffectView(effect: lightBlure)
            
            effectView.frame = countryFlagView.bounds
            effectView.alpha = 0.95
            
            countryFlagView.addSubview(effectView)
            //countryFlagView.layer.borderWidth = 1
            //countryFlagView.layer.borderColor = UIColor.blue.cgColor
            countryFlagView.layer.cornerRadius = 10
//            countryFlagView.clipsToBounds = true
            view.backgroundColor = UIColor.systemGray6
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.isNavigationBarHidden = true
        navigationController?.hidesBarsOnTap = true
        navigationController?.hidesBarsOnSwipe = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        navigationController?.hidesBarsOnSwipe = false
    }
    

    
    
    func CountryFullInfo() {
        nameCountry.isEditable = false
        nameCountry.font = UIFont(name: "Helvetica", size: 32)
        
//        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
//        nameCountry.attributedText = NSAttributedString(attributes: attributes)
//        https://www.hackingwithswift.com/articles/113/nsattributedstring-by-example
        
        nameCountry.backgroundColor = UIColor.systemGray6
        nameCountry.text = "Country: \(selectedCountryName!)\n"
        nameCountry.text += "Capital: "
        let Country = selectedCountryName
        
        switch Country {
        case "Poland":
            nameCountry.text += "Warsaw\nLanguage: Polish\nPopulation: 38.000.000\n"
        case "Russia":
            nameCountry.text += "Moscow"
        case "Estonia":
            nameCountry.text += "Tallinn"
        case "US":
            nameCountry.text += "Washington"
        case "Monaco":
            nameCountry.text += "Monaco"
        case "Nigeria":
            nameCountry.text += "Abuja"
        case "Germany":
            nameCountry.text += "Berlin"
        case "Spain":
            nameCountry.text += "Madrid"
        case "France":
            nameCountry.text += "Paris"
        case "Italy":
            nameCountry.text += "Rome"
        case "UK":
            nameCountry.text += "London"
        case "Ireland":
            nameCountry.text += "Dublin"
        default:
            nameCountry.text += "Error"
        }
        

    }

}
