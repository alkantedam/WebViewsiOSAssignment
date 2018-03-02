//
//  TableViewController.swift
//  WebView
//
//  Created by Alina on 2/22/18.
//  Copyright © 2018 a2b DesignLabs. All rights reserved.
//

import UIKit

var websites: [Websites] = [
    Websites.init("Google", "https://www.google.com", true),
    Websites.init("Facebook", "https://www.facebook.com", false),
    Websites.init("Instagram", "https://www.instagram.com", true)
]

var favorites: [Websites] = []

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var websiteNameTextField: UITextField?
    var websiteAddressTextField: UITextField?
    
    var check: Bool?

    @IBOutlet weak var mySegmentedControll: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a website",
                                      message: "Fill all the fields",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: websiteNameTextField)
        alert.addTextField(configurationHandler: websiteAddressTextField)
        
        let okAction = UIAlertAction(title: "Add", style: .default, handler: self.okHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    func okHandler(alert: UIAlertAction!){
        let new = Websites.init((websiteNameTextField?.text)!, (websiteAddressTextField?.text)!, false)
        websites.append(new)
        print("Website added")
        myTableView.reloadData()
        
    }
    
    func websiteNameTextField(textfield: UITextField!){
        websiteNameTextField = textfield
        websiteNameTextField?.placeholder = "Enter title"
    }
    func websiteAddressTextField(textfield: UITextField!){
        websiteAddressTextField = textfield
        websiteAddressTextField?.placeholder = "Enter url"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for website in websites{
            if website.getIsFavouriteState == true {
                favorites.append(website)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnValue = 0
        
        
        switch mySegmentedControll.selectedSegmentIndex {
        case 0:
            returnValue = websites.count
            break
        case 1:
            
            returnValue = favorites.count
            break
        default:
            break
        }
       
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myTableViewCell
        
        switch mySegmentedControll.selectedSegmentIndex {
        case 0:
            cell.websiteName.text = websites[indexPath.row].getWebsiteName
            
            break
        case 1:
            cell.websiteName.text = favorites[indexPath.row].getWebsiteName
            
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let match = websites[indexPath.row]
            if let deleteIndex = favorites.index(where: {$0 === match}){
                favorites.remove(at: deleteIndex)
            }
            websites.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        if editingStyle == .insert{
            print("Favourite")
            //websites[indexPath.row].getIsFavouriteState = true
            myTableView.reloadData()
        }
    }
    
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        myTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailView"{
            let detailVC: WebViewController = segue.destination as! WebViewController
            switch mySegmentedControll.selectedSegmentIndex {
            case 0:
                detailVC.address = websites[(myTableView.indexPathForSelectedRow?.row)!].getWebsiteUrl!
                detailVC.index = (myTableView.indexPathForSelectedRow?.row)!
                detailVC.isFavorite = websites[(myTableView.indexPathForSelectedRow?.row)!].isFavourite
                break
            case 1:
                detailVC.address = favorites[(myTableView.indexPathForSelectedRow?.row)!].getWebsiteUrl!
                detailVC.index = (myTableView.indexPathForSelectedRow?.row)!
                detailVC.isFavorite = websites[(myTableView.indexPathForSelectedRow?.row)!].isFavourite
                break
            default:
                break
            }
            
            
            
            
        }
    }
}
