//
//  AllAlbumViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage
import Firebase

class AllAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var albumname = [String]()
    var songurl = [String]()
    var albumimagearray = [String]()
    var songuid = [String]()
    var selectedsing = ""
    var singername = [String]()
    var tmp = ""
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.songurl.removeAll()
        self.songuid.removeAll()
        self.albumimagearray.removeAll()
        self.albumname.removeAll()
        self.singername.removeAll()
        getDataFromServer()
        self.navigationItem.title = "Albums"
        // Do any additional setup after loading the view.
    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys
            for album in albumsid {
                let singalbum = albums[album] as! NSDictionary
                if self.tmp != singalbum["albumname"] as! String {
                    
                self.albumname.append(singalbum["albumname"] as! String)
                self.songurl.append(singalbum["songurl"] as! String)
                self.songuid.append(singalbum["uid"] as! String)
                self.albumimagearray.append(singalbum["albumimage"] as! String)
                self.singername.append(singalbum["singername"] as! String)
                }
                self.tmp = singalbum["albumname"] as! String
            }
            self.tableview.reloadData()

            }
            
        }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AlbumTableViewCell
        
        cell.albumimage.sd_setImage(with: URL(string: self.albumimagearray[indexPath.row]))
        cell.albumname.text = albumname[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    //diger vc daki chosensing 'e veri atma
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "albumSongs" {
            let dest = segue.destination as! AlbumSongsViewController
            dest.chosensing = selectedsing
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedsing = albumname[indexPath.row]
        performSegue(withIdentifier: "albumSongs", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
