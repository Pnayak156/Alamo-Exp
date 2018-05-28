//
//  ViewController.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 28/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PostCellIdentifier", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.titleLabel?.text = post.title
        cell.bodyLabel?.text = post.body
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.posts { (result) in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

