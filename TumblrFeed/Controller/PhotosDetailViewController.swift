//
//  PhotosDetailViewController.swift
//  TumblrFeed
//
//  Created by Mihai Ruber on 2/6/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {
    
    // Variables
    var getImage: UIImage = UIImage()
    
    // Outlets
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImage.image = getImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
