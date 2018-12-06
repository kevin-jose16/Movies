//
//  Clients.swift
//  Movies
//
//  Created by Dario on 4/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import Foundation
import os.log

class Clients : NSObject, NSCoding {
    
    
    
    //MARK: Properties
    var name : String
    var email : String
    var favouritesmoviesGenre: String
    var movies : [Movie]
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("clients")
    
    struct PropertyKey {
        static let name = "name"
        static let email = "email"
        static let favouritesmoviesGenre = "favouritesmoviesGenre"
        static let movieslist = "movies"

    }
    
    init?(name: String, email: String, favouritemoviesGenre:String, movies : [Movie]) {
        // Initialization should fail if there is no name or if the rating is negative.
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        guard !email.isEmpty else {
            return nil
        }
        
//        // The rating must be between 0 and 5 inclusively
//        guard (rating >= 0) && (rating <= 5) else {
//            return nil
//        }
        
        // Initialize stored properties.
        self.name = name
        self.email = email
        self.favouritesmoviesGenre = favouritemoviesGenre
        self.movies = movies
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(email, forKey: PropertyKey.email)
        aCoder.encode(favouritesmoviesGenre, forKey: PropertyKey.favouritesmoviesGenre)
        aCoder.encode(movies, forKey: PropertyKey.movieslist)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Client object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let email = aDecoder.decodeObject(forKey: PropertyKey.email) as? String else {
            os_log("Unable to decode the name for a Client object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because favouritemoviesGenre is an optional property of Client, just use conditional cast.
        let favouriteMoviesGenre = aDecoder.decodeObject(forKey: PropertyKey.favouritesmoviesGenre) as? String
   
      let movieslist = aDecoder.decodeObject(forKey: PropertyKey.movieslist)
        
        // Must call designated initializer.
        self.init(name: name, email: email, favouritemoviesGenre: favouriteMoviesGenre!, movies: [Movie]())
    }
    
}
