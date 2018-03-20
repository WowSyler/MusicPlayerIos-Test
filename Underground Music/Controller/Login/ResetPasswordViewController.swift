//
//  ResetPasswordViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import FirebaseAuth


class ResetPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var UserEmailLa: UITextField!
    
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
        UserEmailLa.resignFirstResponder()
    }
    // text klavye kapatma
    
    @IBAction func ResetPasswordB(_ sender: Any) {
        
        /*if UserEmailLa.text != ""{
            Auth.auth().sendPasswordReset(withEmail: UserEmailLa.text!, completion: { (error) in
                if error != nil {
                    let alert = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }else {
            let alert = UIAlertController(title: "Hata", message: "Email Gerekli", preferredStyle: UIAlertControllerStyle.alert)
            let okbutton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
 */
    }
}
