//
//  BaseCellTableViewCell.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/9/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit

class BaseCellTableViewCell: UITableViewCell {

    @IBOutlet weak var catogeryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
   
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
