//
//  SignUpFormView.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import SwiftUI

struct SignUpFormView: View {
    
    @EnvironmentObject var vm : SignUpFormViewModel
    
    var body: some View {
        VStack{
            Text("Create Account")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth : .infinity, maxHeight: 120)
           
            CustomTextField(textField: $vm.userName, label: vm.userNameLabel)
                .padding(.bottom, 16)
            RequireMentText(label: "Minimum of 4 character", iconName: vm.userNameIcon, isStrike: vm.userNameLengthValid)
            CustomTextField(textField: $vm.password, label: vm.passwordLabel, isSecure: true)
                .padding(.bottom, 16)
            RequireMentText(label: "Minimum of 8 character", iconName: vm.passwordIcon, isStrike: vm.passwordValid)
            RequireMentText(label: "One Uppercase letter", iconName: vm.passwordIcon, isStrike: vm.oneCapitalValid)
            CustomTextField(textField: $vm.confirmPassword, label: vm.confirmPasswordLabel, isSecure: true)
                .padding(.bottom, 16)
            RequireMentText(label: "Confirm password should be same as password", iconName: vm.userNameIcon, isStrike: vm.confirmPasswordValid)
            
            
            Button {
                vm.signUpButtonValidation()
            } label: {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame( maxWidth : .infinity, maxHeight: 48)
                        .padding()
                        .foregroundColor(vm.themeColor)
                    Text("SignUp")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                    
                
            }
            Spacer()
        }
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
            .environmentObject(SignUpFormViewModel())
        
    }
}


struct CustomTextField : View {
    @Binding var textField : String
    var label : String
    var isSecure : Bool?
   
    var body : some View {
        
        VStack{
            if isSecure != nil {
                SecureField(text: $textField) {
                    Text(label)
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .frame( maxWidth : .infinity, maxHeight: 48)
                .padding(.horizontal, 8)
            } else {
                TextField(text: $textField) {
                    Text(label)
                        
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .frame(maxWidth : .infinity, maxHeight: 48)
                .padding(.horizontal, 8)
            }
            Divider()
                .frame(height: 1)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
        }
        .padding(.zero)
        
        
    }
}

struct RequireMentText : View {
    var label : String
    var iconName : String
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var isStrike : Bool
    var body: some View{
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(label)
             .strikethrough(isStrike)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.vertical, .horizontal], 2)
    }
}

