//
//  TableViewCell.swift
//  AplikasiBerita
//
//  Created by Gw on 14/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var pot: UIImageView!
    @IBOutlet weak var isber: UILabel!
    @IBOutlet weak var labelber: UILabel!
    @IBOutlet weak var labelCat: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
