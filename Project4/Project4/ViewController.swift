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
        
        setupNavigationBar()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                if item == "us.png" || item == "uk.png" {
                    countries.append(item.replacingOccurrences(of: ".png", with: "").uppercased())
                } else {
                    countries.append(item.replacingOccurrences(of: ".png", with: "").capitalized)
                }
            }
        }
    }
    
    func setupNavigationBar() {
        title = "Countries List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.systemGray6
        view.backgroundColor = UIColor.systemGray6
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
        navigationController?.navigationBar.barTintColor = UIColor.systemYellow
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.barStyle = .black
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countries", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 22)
        cell.textLabel?.text = countries[indexPath.row]
        cell.backgroundColor = UIColor.systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .fade)
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedCountry = "\(countries[indexPath.row]).png".lowercased()
            vc.countries = countries
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
