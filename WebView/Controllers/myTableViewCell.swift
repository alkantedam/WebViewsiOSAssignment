//
//  myTableViewCell.swift
//  WebView
//
//  Created by Alina on 2/21/18.
//  Copyright © 2018 a2b DesignLabs. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    
    @IBOutlet weak var websiteName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
