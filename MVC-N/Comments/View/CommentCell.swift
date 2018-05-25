//
//  CommentCell.swift
//  MVC-N
//
//  Created by Sergey on 20.05.18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
        
    }
}
