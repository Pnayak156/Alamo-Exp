//
//  CommentViewController.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    var postId: Int?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CommentCellIdentifier", for: indexPath) as! CommentTableViewCell
        let comment = comments[indexPath.row]
        cell.nameLabel.text = comment.name
        cell.emailLable.text = comment.email
        cell.bodyLabel.text = comment.body
        return cell
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let postID = postId {
            APIClient.comments(postId: postID, completion: { (result) in
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
   
    

}
