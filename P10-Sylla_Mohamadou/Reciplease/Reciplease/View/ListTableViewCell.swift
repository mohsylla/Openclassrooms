//
//  ListTableViewCell.swift
//  Reciplease
//
//  Created by Sylla on 27/01/2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    func configure(name:String,ingredient:String,yield:String,time:String){
        nameLabel.text = name
        ingredientLabel.text = ingredient
        yieldLabel.text = yield
        timeLabel.text = time
    }
    

}
