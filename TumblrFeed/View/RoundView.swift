//
//  RoundView.swift
//  TumblrFeed
//
//  Created by Mihai Ruber on 1/31/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit

class RoundView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 5
        layer.masksToBounds = false
        layer.borderColor = #colorLiteral(red: 0.2094891369, green: 0.2688970268, blue: 0.3602799177, alpha: 1)
        layer.cornerRadius = self.frame.height/8
        clipsToBounds = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
