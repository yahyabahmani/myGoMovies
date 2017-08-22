//
//  ModelCrew.swift
//  GoMovies
//
//  Created by zafre MAD on 5/29/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//

import Foundation
class ModelCrew {
    private var _type = ""
    private var _name = ""
    
    var taype: String {
        get {
            return _type
        }
        set {
            _type = newValue
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
