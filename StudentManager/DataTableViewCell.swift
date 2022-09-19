//
//  DataTableViewCell.swift
//  StudentManager
//
//  Created by 堀弘昌 on 2022/09/18.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet var DataTitleLabel: UILabel!

    @IBOutlet var DataContentTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
