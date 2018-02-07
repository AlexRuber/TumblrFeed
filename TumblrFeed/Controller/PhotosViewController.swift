//
//  ViewController.swift
//  TumblrFeed
//
//  Created by Mihai Ruber on 1/31/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Variables
    var posts: [[String:Any]] = []
    var refresher: UIRefreshControl!
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Setting up tableview
        tableView.delegate = self
        tableView.dataSource = self
                
        //Manual Refresher Logic
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Refreshing Feed 😊")
        refresher.addTarget(self, action: #selector(PhotosViewController.update), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refresher, at: 0)

        fetchImages()
        
    }
    
    func fetchImages() {
        // Do any additional setup after loading the view, typically from a nib.
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                
                
                // TODO: Get the posts and store in posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                print(self.posts)
                
                
                // TODO: Reload the table view
                self.tableView.reloadData()
                self.refresher.endRefreshing()
            }
        }
        task.resume()
    }
    
    @objc func update() {
        fetchImages()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let post = posts[indexPath.row]
        
        // Unwrap safely
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
            //Set the image
            cell.postImageView.af_setImage(withURL: url!)
            
        }
        cell.accessoryType = UITableViewCellAccessoryType.none

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotosDetailViewController
        let cell = sender as! PhotoCell
        let indexPath = tableView.indexPath(for: cell)!
        guard let photoImage = cell.postImageView.image else { return }
        vc.getImage = photoImage
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

