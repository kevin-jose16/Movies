//
//  Clients.swift
//  Movies
//
//  Created by Dario on 4/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import Foundation

class Clients : NSObject {
    
    //MARK: Properties
    var name : String
    var email : String
    var favouritesmoviesGenre: String
    var movies : [String]
    
    init?(name: String, email: String, favouritemoviesGenre:String) {
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
        self.movies = []
    }
    
}
