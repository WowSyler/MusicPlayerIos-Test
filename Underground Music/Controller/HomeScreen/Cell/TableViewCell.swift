//
//  TableViewCell.swift
//  Underground Music
//
//  Created by Ozan KÜÇÜK on 27.03.2018.
//  Copyright © 2018 Ozan KÜÇÜK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var songname: UILabel!
    @IBOutlet weak var Aimage: UIImageView!
    @IBOutlet weak var singername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
