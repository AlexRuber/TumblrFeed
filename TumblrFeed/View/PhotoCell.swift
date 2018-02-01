//
//  PhotoCell.swift
//  TumblrFeed
//
//  Created by Mihai Ruber on 1/31/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    // Variables
    
    // Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code


    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
