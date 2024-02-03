//
//  MealTypeCell.swift
//  MealVille
//
//  Created by Amandeep tirhima on 03/06/22.
//

import UIKit

class MealTypeCell: UITableViewCell {
    
    @IBOutlet var lblMealType: UILabel!
    @IBOutlet var lblMealPrice: UILabel!
    @IBOutlet var lblMealCount: UILabel!




    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
