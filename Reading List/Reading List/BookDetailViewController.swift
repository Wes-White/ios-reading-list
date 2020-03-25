//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Wesley Ryan on 3/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var AddBookTitleTextField: UITextField!
    
    @IBOutlet weak var AddBookTextView: UITextView!
    
    let bookController = BookController()
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddBookSave(_ sender: Any) {
        guard let title = AddBookTitleTextField.text,
            let reason = AddBookTextView.text else { return }
        
        bookController.createBook(title: title, reasonToRead: reason, hasBeenread: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
