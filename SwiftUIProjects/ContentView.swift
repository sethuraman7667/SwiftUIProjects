//
//  ContentView.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink {
                    SignUpFormView()
                        .environmentObject(SignUpFormViewModel())
                } label: {
                    Text("Sign Up, MVVM, Combine")
                }

                NavigationLink {
                    RestaurantList()
                        .environmentObject(SettingsViewModel())
                } label: {
                    Text("Restaurant List, UserDef")
                }
                
                NavigationLink {
                    RestList()
                        .environmentObject(SettingsViewModel())
                } label: {
                    Text("Restaurant List, Context Menu, Del")
                }
                
                NavigationLink {
                    TinderUI()
                } label: {
                    Text("Tinder UI")
                }

                
            }
            .navigationTitle("Swift UI Projects")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
