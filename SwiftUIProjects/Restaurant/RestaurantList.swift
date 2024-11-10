//
//  RestaurantList.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import SwiftUI

struct RestaurantList: View {
    @EnvironmentObject var vm : SettingsViewModel
    @State var showSettingScreen : Bool = false
    var body: some View {
        NavigationView{
            List {
                ForEach(vm.filteredRestaurant()) { rest in
                    RestaurantCell(restaurant: rest)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                        .onTapGesture {
                            print("settings tapped")
                            showSettingScreen = true
                        }
                }
            }
            .sheet(isPresented:  $showSettingScreen) {
                SettingView(showSettings : $showSettingScreen)
                    
            }
        }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
            .environmentObject(SettingsViewModel())
    }
}


    struct RestaurantCell : View {
        let restaurant : Restaurant
        var body: some View{
            HStack{
                Circle()
                    .frame(width: 64, height: 64, alignment: .leading)
                    .foregroundColor(.purple)
                VStack(alignment : .leading){
                    Text(restaurant.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(restaurant.type)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(restaurant.phone)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
