//
//  TipoObjetivoTableViewCell.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class TipoObjetivoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outletTitle: UILabel!
    @IBOutlet weak var outletDescription: UILabel!
    @IBOutlet weak var outletExample: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
