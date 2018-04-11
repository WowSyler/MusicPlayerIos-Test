//
//  SearchViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!

    var searchActive : Bool = false
   
    struct sing {
        var name = String()
       
    }
    
    var sings = [sing]()
    var singstmp = [sing]()
    var filtered = [sing]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()

        searchController.searchResultsUpdater = self
       searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableview.tableHeaderView = searchController.searchBar
        
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in

            
            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys
            for album in albumsid {
                let singalbum = albums[album] as! NSDictionary
                
                let sing2 = singalbum["songname"] as! String
                self.singstmp = [sing(name: sing2)]
                print(sing2)
                self.sings = self.singstmp + self.sings

            }
            
        }
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
        self.tableview.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
        self.tableview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        self.tableview.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        self.tableview.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            
            self.tableview.reloadData()
        } else {
            // Filter
            filtered = sings.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        
            self.tableview.reloadData()
        }
        
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.filtered[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }

    
    
    
    
}
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
