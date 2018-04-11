//
//  ProfilAndListViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage
import Firebase


class ProfilAndListViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailuser: UILabel!
    
    var useremail = ""
    
    
    
    //text alani disinda klayve kapatma
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    //======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromServer()
        // Do any additional setup after loading the view.
    }
    func getDataFromServer(){
        let useremail = Auth.auth().currentUser?.email
        emailuser.text = useremail
        print(useremail!)

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
