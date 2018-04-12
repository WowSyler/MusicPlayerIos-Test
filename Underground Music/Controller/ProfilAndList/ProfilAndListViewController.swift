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
import FirebaseAuth


class ProfilAndListViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailuser: UILabel!
    
    var useremail = ""
    
    
    
    //text alani disinda klayve kapatma
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromServer()
        // Do any additional setup after loading the view.
    }
    @IBAction func logoutbutton(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        let board : UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let singin = board.instantiateViewController(withIdentifier: "SinginScreen") as! SinginViewController
        let deletege : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        deletege.window?.rootViewController = singin
        deletege.userRememberLogin()
        
    }
    
    
    func getDataFromServer(){
        let useremail = Auth.auth().currentUser?.email
        emailuser.text = useremail
        print(useremail!)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}
