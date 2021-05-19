//
//  DetailViewController.swift
//  Project1
//
//  Created by Matvey Garbuzov on 16.05.2021.
//


import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var pictures: [String] = []
   
    //pictures.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = selectedImage Picture X of Y
        title = "Picture \(pictures.firstIndex(of: selectedImage!)!+1) of \(pictures.count)"
        navigationItem.largeTitleDisplayMode = .never //
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
