//
//  searchViewController.swift
//  CUMeme
//
//  Created by 毛悦 on 5/5/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//

import UIKit

class searchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchController: UISearchController!
    var timer: Timer?
    
    let recipeCellIdentifier = "RecipeCell"
    
    var urls: [URL] = []
    var strings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Memes"
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Memes"
        searchController.searchBar.sizeToFit()
        self.navigationItem.titleView = searchController.searchBar
        
        definesPresentationContext = true
        
    }
    
    // MARK: UITableView Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: recipeCellIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: recipeCellIdentifier)
        
        let string = strings[indexPath.row]
//        let imageURL = UIImage.gifImageWithURL(string)
//        cell.imageView?.image = URL(fileURLWithPath: string)
        
        do {
        let url = URL(string: string)
        let data = try Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data)
        }
        catch{
            print("error")
        }


        return cell
        
    }
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(getTracks(_:)), userInfo: ["searchText": searchText], repeats: false)
    }
    

    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty && searchText != ""  {

            }
            else {
                
            }
        }
        
    }
    
    // MARK: Network
    
    @objc func getTracks(_ timer: Timer) {
        print("called getTracks")
        
        guard
            let userInfo = timer.userInfo as? [String : String],
            let searchText = userInfo["searchText"]
            else {
                return
        }
        
        if !searchText.isEmpty{
            Network.getTracks(withQuery: searchText) { (strings) in
                self.strings = strings
                self.tableView.reloadData()
            }
        }
        else {
            strings = []
            self.tableView.reloadData()
        }
        
        //       self.tableView.reloadData()
        
    }
    
    
    
}
