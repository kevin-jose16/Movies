//
//  Movie.swift
//  Movies
//
//  Created by Dario on 5/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import Foundation
class Movie : NSObject {
    
    //MARK: Properties
    var Id : String
    var Title : String
    var RunTime: String
    var Language : String
    var Country : String
    var Genre : String
    var Plot : String
    var Released : String
    var Image : String
    
    
    
    init?(Id : String,  Title: String,RunTime: String,Language: String, Country: String, Genre:String, Plot: String, Released: String, Image: String) {
        // Initialization should fail if there is no name or if the rating is negative.
        // The name must not be empty
        guard !Id.isEmpty else {
            return nil
        }
        guard !Title.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.Id = Id
        self.Title = Title
        self.RunTime = RunTime
        self.Language = Language
        self.Country = Country
        self.Genre = Genre
        self.Plot = Plot
        self.Released = Released
        self.Image = Image
    }
    
}
