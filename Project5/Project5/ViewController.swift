//
//  ViewController.swift
//  Project5
//
//  Created by Matvey Garbuzov on 03.06.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    @objc func openTapped() {
        let ac = UIAlertController(title: "Which site do you wanna open?", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "github", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "google", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "yandex", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "vk", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "apple", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title! + ".com")!
        webView.load(URLRequest(url: url))
    }
}

