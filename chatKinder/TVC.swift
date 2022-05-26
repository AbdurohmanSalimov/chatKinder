//
//  TableViewCell.swift
//  chatKinder
//
//  Created by Azizbek Salimov on 25.05.2022.
//

import UIKit

class TVC: UITableViewCell {

    @IBOutlet weak var viewM: UIView!
    @IBOutlet weak var massageLbl: UILabel!
    @IBOutlet weak var lblMy: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblMy.text = "from Azizbek"
        massageLbl.text = "sdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsfsdfsfdsfdsf"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
