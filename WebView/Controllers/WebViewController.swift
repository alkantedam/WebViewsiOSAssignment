//
//  WebViewController.swift
//  WebView
//
//  Created by Alina on 2/21/18.
//  Copyright © 2018 a2b DesignLabs. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate{
    
    @IBOutlet weak var favButton: UIButton!
    var loadingActivity = UIActivityIndicatorView()
    var isFavorite: Bool?
    var index: Int = 0
    
    @IBAction func isFavouriteButton(_ sender: UIButton) {
        setButton()
       
        if !isFavorite!{
            isFavorite = true
            addFavourite(index)
        }
        else{
            isFavorite = false
            removeFavourite(index)
        }
    }
    @IBOutlet weak var webView: WKWebView!
    
    func addFavourite(_ index: Int){
        websites[index].isFavourite = true
        favorites.append(websites[index])
        for i in websites{
            print("\(String(describing: i.websiteName)) \(i.isFavourite)")
        }
    }
   
    func removeFavourite(_ index: Int){
        websites[index].isFavourite = false
        let delIndex = favorites.index(of: websites[index])
        favorites.remove(at: delIndex!)
        
        for i in websites{
            print("\(String(describing: i.websiteName)) \(i.isFavourite)")
        }
    }
    
    func setButton(){
        if isFavorite != nil{
            if !isFavorite!{
                favButton.setTitle("Remove", for: .normal)
            }
            else{
                favButton.setTitle("Add", for: .normal)
            }
        }
    }
    var address: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if isFavorite != nil{
            if !isFavorite!{
                favButton.setTitle("Add", for: .normal)
            }
            else{
                favButton.setTitle("Remove", for: .normal)
            }
        }
        if address != nil{
            webView.navigationDelegate = self
            webView.uiDelegate = self
            loadingActivity.center = self.view.center
            loadingActivity.hidesWhenStopped = true
            loadingActivity.activityIndicatorViewStyle = .gray
            webView.addSubview(loadingActivity)
            let url = URL(string: address!)
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            loadingActivity.startAnimating()
            print("started")
        } else {
            loadingActivity.stopAnimating()
            print("stopped")
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
