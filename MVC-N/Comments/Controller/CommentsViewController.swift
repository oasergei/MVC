//
//  ViewController.swift
//  MVC-N
//
//  Created by Sergey on 19.05.18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
            print("viewDidLoad OK!")
        }
    }
}

extension CommentsViewController: UITableViewDelegate {}

extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
}

