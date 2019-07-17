//
//  CustomUIView.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 17/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 18
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
