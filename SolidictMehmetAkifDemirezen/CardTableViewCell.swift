//
//  CardTableViewCell.swift
//  SolidictMehmetAkifDemirezen
//
//  Created by akif demirezen on 15/01/2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var labelOfMail: CustomLabel!
    @IBOutlet weak var labelOfPhoneNumber: CustomLabel!
    @IBOutlet weak var labelOfCompanyAdress: CustomLabel!
    @IBOutlet weak var labelOfCompany: CustomLabel!
    @IBOutlet weak var labelOfJob: CustomLabel!
    @IBOutlet weak var labelFullName: CustomLabel!
    @IBOutlet weak var imageViewOfProfile: UIImageView!
   
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
