//
//  SingupViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class SingupViewController: UIViewController, UITextFieldDelegate {

    
   
    @IBOutlet weak var UserEmailLabel: UITextField!
    @IBOutlet weak var UserPasswordLabel: UITextField!
    @IBOutlet weak var UserPassword2Label: UITextField!
    
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
    UserPassword2Label.resignFirstResponder()
    
    }
// text klavye kapatma
    
        
    @IBAction func SingUpButton(_ sender: Any) {
    
    
        if UserEmailLabel.text != "" && UserPasswordLabel.text != "" {
            if UserPasswordLabel.text == UserPassword2Label.text {
                Auth.auth().createUser(withEmail: UserEmailLabel.text!, password: UserPasswordLabel.text!, completion: { (user, error) in
                    if error != nil {
                        let alert = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                        let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                        alert.addAction(okbutton)
                        self.present(alert, animated: true, completion: nil)
                        
                    }else {
                        //Ana ekrana yonlendiriyoruz ba;arili olursa
                        self.performSegue(withIdentifier: "ToHomaFromSingup", sender: nil)
                    }
                })
            
                
            }else {
                let alert = UIAlertController(title: "Hata", message: "Sifreler ayni olmali", preferredStyle: UIAlertControllerStyle.alert)
                let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
            }
        }else {
            let alert = UIAlertController(title: "Hata", message: "E-mail ve Sifre Gerekli", preferredStyle: UIAlertControllerStyle.alert)
            let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
}
