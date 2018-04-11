//
//  HomeScreenViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import SDWebImage


class HomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
   
    
   
    @IBOutlet weak var collettionview: UICollectionView!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var bartab: UITabBarItem!
    
    
    var albumname = [String]()
    var singername = [String]()
    var songname = [String]()
    var songurl = [String]()
    var songimageurl = [String]()
    var songuid = [String]()
   
    //text alani disinda klayve kapatma
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //======
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.singername.removeAll()
        self.songuid.removeAll()
        self.songimageurl.removeAll()
        self.songname.removeAll()
        self.albumname.removeAll()
        self.songurl.removeAll()
       // self.view.addSubview(collettionview)
       // self.view.addSubview(collettionview2)

        getDataFromServer()
        
        
        if #available(iOS 11.0, *) {
            if bartab.isSpringLoaded == true{
                bartab.isSpringLoaded = true
                
            }   else{
                bartab.isSpringLoaded = true
            }
        } else {
            
        }
        // Do any additional setup after loading the view.
    }
    func getDataFromServer(){
        Database.database().reference().child("MusicA").observe(DataEventType.childAdded) { (snapshot) in
            //print("1.value : \(String(describing: snapshot.value))")
            // print("1.key : \(snapshot.key)")
            


            let values = snapshot.value! as! NSDictionary
            let albums = values["album"] as! NSDictionary
            let albumsid = albums.allKeys
            for album in albumsid {
                let singalbum = albums[album] as! NSDictionary
                
                //print("singer isimleri \(String(describing: singalbum["singername"] as! String))")
                self.albumname.append(singalbum["albumname"] as! String)
                self.singername.append(singalbum["singername"] as! String)
                self.songname.append(singalbum["songname"] as! String)
                self.songurl.append(singalbum["songurl"] as! String)
                //self.songimageurl.append(singalbum["albumname"] as! String)
                self.songuid.append(singalbum["uid"] as! String)
                 //print(singalbum["albumname"] as! String)
                //print(album)
                self.songimageurl.append(singalbum["albumimage"] as! String)
                
                    
                }
            for sing in self.songimageurl{
                print(sing)
            }
            self.collettionview.reloadData()
            self.tableview.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Colletionview metodlari
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collettionview {
        return singername.count
        }
        return songname.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collettionview{
            
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        //myCell Storyboarddaki hucre adi
        // as! ...viewCell  hucreyi yonetecek sinif olarak belirliyoruz.
        cell.layer.cornerRadius = 15
        cell.SingerName.text = singername[indexPath.row]
        cell.SongName.text = songname[indexPath.row]
        cell.albumName.text = albumname[indexPath.row]
        cell.albumimage.sd_setImage(with: URL(string: self.songimageurl[indexPath.row]))
        //array olarakta atayabiliriz named: resimler[indexpad.row]/
        
        return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            cell.layer.cornerRadius = 15

            cell.SongName.text = songname[indexPath.row]
            cell.albumName.text = albumname[indexPath.row]
            
            return cell
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listTomusic11", sender: nil)
        //bir hucreye tiklandiginda ne yapacak.
    }
    
    //Colletionview
    
    //tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singername.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath) as! TableViewCell
         cell2.singername.text = singername[indexPath.row]
            cell2.songname.text = songname[indexPath.row]
        cell2.Aimage.sd_setImage(with: URL(string: self.songimageurl[indexPath.row]))

        return cell2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listTomusic11", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listTomusic11" {
            _ = segue.destination as! MusicPlayViewController
            
            
        }
    }

}
