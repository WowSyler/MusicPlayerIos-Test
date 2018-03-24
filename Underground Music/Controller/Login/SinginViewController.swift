//
//  SinginViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SinginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var UserEmailLabel: UITextField!
    @IBOutlet weak var UserPasswordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //text alani disinda klayve kapatma
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UserEmailLabel.resignFirstResponder()
        UserPasswordLabel.resignFirstResponder()
        
    }
    // text klavye kapatma
    @IBAction func SinginButton(_ sender: Any) {
        if UserEmailLabel.text != "" && UserPasswordLabel.text != "" {
            Auth.auth().signIn(withEmail: UserEmailLabel.text!, password: UserPasswordLabel.text!, completion: { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                  
                    UserDefaults.standard.set(user!.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    let delegete : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegete.userRememberLogin()
                    
                    
                    //self.performSegue(withIdentifier: "ToHomeFromSingin", sender: nil)
                }
            })
            
            
            
        }else{
            let alert = UIAlertController(title: "Hata", message: "E-mail veya Sifre Bos Olamaz", preferredStyle: UIAlertControllerStyle.alert)
            let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    

    
    
    
    
}








