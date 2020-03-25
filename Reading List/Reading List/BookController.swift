//
//  BookController.swift
//  Reading List
//
//  Created by Wesley Ryan on 3/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book] = []
    
    var unreadBooks: [Book] {
        
        return books.filter { $0.hasBeenRead == false }
    }
    
    var readBooks: [Book] {
        return books.filter { $0.hasBeenRead == true}
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    //MARK: CRUD FUNCTIONS
    
    func createBook(title: String, reasonToRead: String, hasBeenread: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(for book: Book) {
    
        guard let book = books.firstIndex(of: book) else { return }
        if books[book].hasBeenRead == true {
            books[book].hasBeenRead.toggle()
        }
    }
    
    func updateBook(for book: Book) {
        
    }
    
    
    
    var readingListURL: URL? {
        //Where are we going to save and load our books?
        let fileManager = FileManager.default
        //Get Documents directory
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        //Create a loction for the plist
        let booksUrl = documentsDir?.appendingPathComponent("ReadingList.plist")
        
        return booksUrl
    }
    
    func saveToPersistentStore() {
        do {
            //create the encoder
            let encoder = PropertyListEncoder()
            //convert the books
            let booksPlist = try encoder.encode(books)
            //get the location
            guard let readingListURL = readingListURL else { return }
            //save the file
            try booksPlist.write(to: readingListURL)
            
        } catch {
            print("Error saving your Reading List \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        //make sure location is accessible
        guard let readingListURL = readingListURL else { return }
        do {
            //create the decoder
            let decoder = PropertyListDecoder()
            //grab the plist
            let booksPlist = try Data(contentsOf: readingListURL)
            //decode the plist
            let books = try decoder.decode([Book].self, from: booksPlist)
        } catch {
            print("Error loading the Reading List \(error)")
        }
    }
}
