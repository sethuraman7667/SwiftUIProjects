//
//  SettingsViewModel.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import Foundation


class SettingsViewModel : ObservableObject {
    
    static let displayConstant = "view.preference.displayOrder"
    static let toggleConstant = "view.preference.toggleConstant"
    static let countConstant = "view.preference.countConstant"
//    var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-i n First"]
    
    init(){
        UserDefaults.standard.register(defaults: [
            "view.preference.displayOrder" : 0,
            "view.preference.toggleConstant" : false,
            "view.preference.countConstant" : 0
        ])
    }
    
   @Published var displayOrder : DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey: displayConstant)) {
        didSet{
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preference.displayOrder")
        }
    }
    
    @Published var isToggeleOn : Bool =  UserDefaults.standard.bool(forKey: toggleConstant){
         didSet{
             UserDefaults.standard.set(isToggeleOn, forKey: "view.preference.toggleConstant")
         }
     }
    
    @Published var maxPrice : Int =  UserDefaults.standard.integer(forKey: displayConstant) {
         didSet{
             UserDefaults.standard.set(maxPrice, forKey: "view.preference.countConstant")
         }
     }
    
    
    func filteredRestaurant() -> [Restaurant]{
        if displayOrder == .alphabetical {
            return restaurants.sorted(by: >)
        } else  {
            return restaurants
        }
    }
    
   
    
    
    
    @Published var restaurants  = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        Restaurant(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        Restaurant(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        Restaurant(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        Restaurant(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        Restaurant(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        Restaurant(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        Restaurant(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        Restaurant(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        Restaurant(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
        ]
    
    
}

enum DisplayOrderType : Int, CaseIterable {
    case alphabetical = 0
    case favouriteFirst = 1
    case checkInFirst = 2
    
    init(type: Int) {
        switch type {
        case 0: self = .alphabetical
        case 1 : self = .favouriteFirst
        case 2 : self = .checkInFirst
        default : self = .alphabetical
        }
    }
    
    var text : String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favouriteFirst:
            return "Favourite"
        case .checkInFirst:
            return "Check In First"
        }
    }
}

