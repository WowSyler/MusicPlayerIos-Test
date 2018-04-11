//
//  AllSingerViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage
import Firebase

class AllSingerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    var singername = [String]()
    var songurl = [String]()
    var albumimage = [String]()
    var songuid = [String]()
    var selectedsing = ""
    var tmp = ""
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songurl.removeAll()
        self.songuid.removeAll()
        self.albumimage.removeAll()
        self.singername.removeAll()
        getDataFromServer()
        _ = GetFirebaseData()
        self.navigationItem.title = "Singers"

    
        // Do any additional setup after loading the view.
    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys

            for album in albumsid {
                let singalbum = albums[album] as! NSDictionary
                if self.tmp != singalbum["singername"] as! String {
                self.singername.append(singalbum["singername"] as! String)
                self.songurl.append(singalbum["songurl"] as! String)
                self.songuid.append(singalbum["uid"] as! String)
                self.albumimage.append(singalbum["albumimage"] as! String)
                self.tmp = singalbum["singername"] as! String
                }}
            self.tableview.reloadData()
            
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singername.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! singerTableViewCell
        
        cell.albumimage.sd_setImage(with: URL(string: self.albumimage[indexPath.row]))
        cell.singernamee.text = singername[indexPath.row]
        
        return cell
    }
    
//diger vc daki chosensing 'e veri atma 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectSinger" {
            let dest = segue.destination as! SingerSongsViewController
            dest.chosensing = selectedsing
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedsing = singername[indexPath.row]
        performSegue(withIdentifier: "SelectSinger", sender: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
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
