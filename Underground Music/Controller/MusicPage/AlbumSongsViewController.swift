//
//  AlbumSongsViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import SDWebImage

class AlbumSongsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    var songname = [String]()
    var songurl = [String]()
    var albumimage = [String]()
    var songuid = [String]()
    var singername = [String]()
    var chosensing = ""
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songurl.removeAll()
        self.songuid.removeAll()
        self.albumimage.removeAll()
        self.songname.removeAll()
        self.singername.removeAll()
        print(chosensing)
        getDataFromServer()
        // Do any additional setup after loading the view.
        self.navigationItem.title = chosensing

    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys
            
            for album in albumsid {
                
                let singalbum = albums[album] as! NSDictionary
                
                if self.chosensing == singalbum["albumname"] as! String {
                    
                    self.songname.append(singalbum["songname"] as! String)
                    self.songurl.append(singalbum["songurl"] as! String)
                    self.songuid.append(singalbum["uid"] as! String)
                    self.albumimage.append(singalbum["albumimage"] as! String)
                }
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! albumSongTableViewCell
        
        cell.albumimage.sd_setImage(with: URL(string: self.albumimage[indexPath.row]))
        cell.songname.text = songname[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listTomusic3", sender: nil)
    }
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    //}
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
  

 

}
