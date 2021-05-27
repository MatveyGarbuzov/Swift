//
//  ViewController.swift
//  Project4
//
//  Created by Matvey Garbuzov on 26.05.2021.
//


import UIKit

class ViewController: UIViewController {
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                countries.append(item)
            }
        }
        
        print(countries)
        print(countries.count)
    }


}
