//
//  model.swift
//  GoMovies
//
//  Created by zafre MAD on 5/25/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//

import Foundation
class Model {
    
    private var _id = 0
    private var _name = ""
    var image = Image()
    private var _description = ""
    var desciptin: String {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }

    var rating = Rating()


   private var _genres = [String]()
    
    var genres: [String] {
        get {
            return _genres
        }
        set {
            _genres = newValue
        }
    }
    
    var id: Int {
        get {
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    
    
    
    
    
    
}

class Rating {
    private var _average = 0.0
    var average: Double{
        get {
            return _average
        }
        set {
            _average = newValue
        }
    }
}
class Image {
    private var _medium = ""

    private var _original = ""
    
    
    var medium: String {
        get {
            return _medium
        }
        set {
            _medium = newValue
        }
    }
    
    
    
    var original: String {
        get {
            return _original
        }
        set {
            _original = newValue
        }
    }
    
    

}
