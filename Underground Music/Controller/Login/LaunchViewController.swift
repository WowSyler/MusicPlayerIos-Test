//
//  LaunchViewController.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 19.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit
import SwiftyGif

class LaunchViewController: UIViewController {

    @IBOutlet weak var imag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let gif = UIImage(gifName: "smusic.gif")
        self.imag.setGifImage(gif)
       
        // Do any additional setup after loading the view.
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
