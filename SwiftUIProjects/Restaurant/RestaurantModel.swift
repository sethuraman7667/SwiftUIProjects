//
//  RestaurantModel.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import Foundation

struct Restaurant :  Identifiable, Comparable {
    static func < (lhs: Restaurant, rhs: Restaurant) -> Bool {
        lhs.name  > rhs.name
    }
    
    var id = UUID()
    var name : String
    var type : String
    var phone : String
    var image : String
    var priceLevel : Int
    var isFavorite : Bool = false
    var isCheckIn : Bool = false
    
}
