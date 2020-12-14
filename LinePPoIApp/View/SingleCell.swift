//
//  CustomCell.swift
//  Section22ChatApp
//
//  Created by YhamIVan on 2020/11/01.
//

import UIKit

class SingleCell: UITableViewCell {
    
    
    @IBOutlet weak var img_SingleCell: UIImageView!
    @IBOutlet weak var userName_SingleCell: UILabel!
    @IBOutlet weak var comments_SIngleCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
