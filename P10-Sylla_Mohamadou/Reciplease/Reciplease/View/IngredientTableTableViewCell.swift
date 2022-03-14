//
//  IngredientTableTableViewCell.swift
//  Reciplease
//
//  Created by Sylla on 26/01/2022.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var textLabelIngredient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(ingredient:String){
            textLabelIngredient.text = "- \(ingredient)"
        }
}

