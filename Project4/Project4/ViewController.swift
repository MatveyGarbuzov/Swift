//
//  ViewController.swift
//  Project4
//
//  Created by Matvey Garbuzov on 26.05.2021.
//


import UIKit

class ViewController: UITableViewController {
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
        print("S")
        print(countries)
        print(countries.count)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countries", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
}
