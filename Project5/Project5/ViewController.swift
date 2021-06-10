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
    var progressView: UIProgressView!
    var webSites = ["apple.com", "google.com", "github.com", "yandex.com", "vk.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let openButton = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        openButton.tintColor = UIColor.systemYellow
        navigationItem.rightBarButtonItem = openButton
        
        let flexSpacer  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let fixedSpacer  = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        let forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        let progressButton = UIBarButtonItem(customView: progressView)
        
        progressView = UIProgressView(progressViewStyle: .default)
        fixedSpacer.width = 30
        backButton.tintColor    = UIColor.systemYellow
        forwardButton.tintColor = UIColor.systemYellow
        refresh.tintColor       = UIColor.systemYellow
        //progressView.sizeToFit()
        
        toolbarItems = [backButton, forwardButton, fixedSpacer, progressButton, flexSpacer, refresh]
        navigationController?.isToolbarHidden = false
        
        
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://" + webSites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    

    @objc func openTapped() {
        let ac = UIAlertController(title: "Which site do you wanna open?", message: nil, preferredStyle: .actionSheet)
        
        for website in webSites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            //progressView.tintColor = UIColor.systemPink
            progressView.progressTintColor = UIColor.systemYellow
        }
    }
}

