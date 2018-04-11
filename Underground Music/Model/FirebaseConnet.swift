//
//  FirebaseConnet.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 26.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage



class GetFirebaseData {

    var albumname = [String]()
    var singername = [String]()
    var songname = [String]()
    var songurl = [String]()
    var songimageurl = [String]()
    var songuid = [String]()
    
    var SingerList = [String]()
    var AlbumsList = [String]()
    var SongList = [String]()
    
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
                self.songimageurl.append(singalbum["albumname"] as! String)
                self.songuid.append(singalbum["uid"] as! String)
               // print(singalbum["albumname"])
                for sing in self.singername{
                    var cahce = "not"
                    if sing != cahce {
                            self.SingerList.append(sing)
                    }
                    cahce = sing

                    }
                }
                
                
            }
 
            //print("sozluk:\(self.singername[0])")
        //            self.tableview.reloadData()

        }
    }
    
    
    
    
    
    
//   let addFirebaseConnet = GetFirebaseData()
//    override func viewWillAppear(_ animated: Bool) {
 //       addFirebaseConnet.getDataFromServer()
//            self.collettionview.reloadData()

 //   }
    
    

