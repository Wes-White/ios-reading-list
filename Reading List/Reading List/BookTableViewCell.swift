//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Wesley Ryan on 3/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var BookLabel: UILabel!
    
    @IBOutlet weak var BookHasBeenReadButton: UIButton!
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    var delegate: BookTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func hasBeenReadButton(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        
        let checked = UIImage(named: "checked")
        let unchecked = UIImage(named: "unchecked")
        
        guard  let book = book else { return }
        
        BookLabel.text = book.title
        if book.hasBeenRead == true {
            BookHasBeenReadButton.setImage(checked, for: .normal)
        } else {
            BookHasBeenReadButton.setImage(unchecked, for: .normal)
        }
        
    }

}
