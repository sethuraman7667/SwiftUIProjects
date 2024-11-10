//
//  SettingView.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import SwiftUI

struct SettingView: View {
  
        @Binding var showSettings : Bool
        @EnvironmentObject var vm : SettingsViewModel
        var body: some View {
            
            NavigationView {
                Form{
                    Section {
                        Picker(selection: $vm.displayOrder ) {
                            ForEach(DisplayOrderType.allCases, id: \.self) { orders in
                                    Text(orders.text)
                                    .onTapGesture {
                                        vm.displayOrder = orders
                                        
                                    }
                            }
                        } label: {
                            HStack{
                                Text("Display Order")
                               
                            }
                        }

                    } header: {
                        Text("Sort Preference")
                    }
                    
                    Section {
                        Toggle(isOn: $vm.isToggeleOn) {
                            Text("Show Check-in only")
                        }
                        Stepper("Count \(vm.maxPrice)") {
                            vm.maxPrice += 1
                        } onDecrement: {
                            vm.maxPrice -= 1
                        }

                    } header: {
                        Text("Filter Preference")
                    }

                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showSettings.toggle()
                            
                        } label: {
                            Text("Cancel")
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showSettings.toggle()
                        } label: {
                            Text("Save")
                        }

                    }
                })
                .navigationTitle("Settings")
            }
            
            
            
        }
    }


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(showSettings : .constant(true))
            .environmentObject(SettingsViewModel())
    }
}



