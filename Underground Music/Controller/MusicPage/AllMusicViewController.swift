//
//  AllMusicViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage
import Firebase

class AllMusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var songname = [String]()
    var songurl = [String]()
    var albumimage = [String]()
    var songuid = [String]()

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songurl.removeAll()
        self.songuid.removeAll()
        self.albumimage.removeAll()
        self.songname.removeAll()
       getDataFromServer()
        self.navigationItem.title = "Musics"

        // Do any additional setup after loading the view.
    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys
            for album in albumsid {
                let singalbum = albums[album] as! NSDictionary
                self.songname.append(singalbum["songname"] as! String)
                self.songurl.append(singalbum["songurl"] as! String)
                self.songuid.append(singalbum["uid"] as! String)
                self.albumimage.append(singalbum["albumimage"] as! String)

            }
            self.tableview.reloadData()
            
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllmusicPageTableViewCell
        
        cell.resim.sd_setImage(with: URL(string: self.albumimage[indexPath.row]))
        cell.songname.text = songname[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listTomusic1", sender: nil)
    }
  
   
  

}
