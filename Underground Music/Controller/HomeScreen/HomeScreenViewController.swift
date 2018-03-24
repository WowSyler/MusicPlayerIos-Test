//
//  HomeScreenViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    //Colletionview metodlari
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! HomeColletion1CollectionViewCell
        //myCell Storyboarddaki hucre adi
        // as! ...viewCell  hucreyi yonetecek sinif olarak belirliyoruz.
        cell.layer.cornerRadius = 15
        
        cell.Albumimage.image = UIImage(named: "smusic")
        //array olarakta atayabiliriz named: resimler[indexpad.row]/
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //bir hucreye tiklandiginda ne yapacak.
    }
//Colletionview

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
