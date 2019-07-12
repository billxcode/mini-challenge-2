//
//  CustomButton.swift
//  Sprintastic
//
//  Created by Idris on 12/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        layer.cornerRadius = 5
    }
}
