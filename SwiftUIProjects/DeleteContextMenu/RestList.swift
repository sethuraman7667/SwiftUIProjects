//
//  RestList.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 10/11/24.
//

import SwiftUI

struct RestList: View {
    @EnvironmentObject private var vm : SettingsViewModel
    @State var isShowSheet : Bool = false
    @State var selectedRestaurant : Restaurant?
    var body: some View {
        List {
            ForEach(vm.restaurants) { rest in
                Text(rest.name)
                    .onTapGesture {
                        selectedRestaurant = rest
                        isShowSheet.toggle()
                        print(selectedRestaurant?.name)
                    }
                    .contextMenu{
                        Button {
//                            vm.restaurants.re
                        } label: {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Favourite")
                            Image(systemName: "star")
                        }

                    }
            }
            .onDelete { index in
                vm.restaurants.remove(atOffsets: index)
            }
            .sheet(isPresented: $isShowSheet) {
                Text(selectedRestaurant?.name ?? "")
                    
            }
        }
    }
}

struct RestList_Previews: PreviewProvider {
    static var previews: some View {
        RestList()
            .environmentObject(SettingsViewModel())
    }
}
