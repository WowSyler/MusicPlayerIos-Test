//
//  CreateNewListViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class CreateNewListViewController: UIViewController {

    var chosenlist = ""
    var uuid = NSUUID().uuidString
    
    @IBOutlet weak var listnew: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func savebutoon(_ sender: Any) {
        
        
        let liste = ["creataby" : Auth.auth().currentUser!.email!, "uuid" : self.uuid, "listnew" : self.listnew.text! ] as [String : Any]
        
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("list").childByAutoId().setValue(liste)
    
        
        //bir onceki sayfaya git
        self.navigationController?.popViewController(animated: true)

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
