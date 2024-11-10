//
//  SignUpViewModel.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 09/11/24.
//

import Foundation
import SwiftUI
import Combine

class SignUpFormViewModel : ObservableObject {
    
    @Published var userName : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    
     let userNameLabel : String = "Enter username"
     let passwordLabel : String = "Enter Password"
     let confirmPasswordLabel : String = "Re-Enter Password"
    
     let userNameIcon : String = "xmark.square"
     let passwordIcon : String = "lock.open"
    
    @Published var userNameLengthValid : Bool = false
    @Published var passwordValid : Bool = false
    @Published var oneCapitalValid : Bool = false
    @Published var confirmPasswordValid : Bool = false
    
    private var cancellableSet : Set<AnyCancellable> = []
    
   let themeColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    init() {
        combineUserNameMethod()
    }
    
    func userNameValidation() -> Bool {
        if  userName.count > 3 && hasCapitalLetter() {
            return true
        }
        return false
    }
    
    func hasCapitalLetter() -> Bool {
        let hasUppercase = userName.range(of: "[A-Z]", options: .regularExpression) != nil
        return hasUppercase
    }
    
    func passWordValidation() -> Bool{
        if password.count > 7  {
            return true
        } else {
            return false
        }
    }
    
    func confirmPassWordValidation() -> Bool{
        if confirmPassword == password {
            return true
        } else {
            return false
        }
    }
    
    func signUpButtonValidation(){
        if(userNameValidation() && passWordValidation() && confirmPassWordValidation()){
            print("done")
        } else if (!userNameValidation()){
            print("Enter valid username")
        } else if (!passWordValidation()){
            print("Enter valid password")
        } else if (!confirmPassWordValidation()){
            print("Enter valid confirm password")
        }
    }
    
    /// combine methods
    func combineUserNameMethod(){
        $userName
            .receive(on: RunLoop.main)
            .map { user in
                print(user)
                return user.count > 3
            }
            .assign(to: \.userNameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        
        
        $password
            .receive(on: RunLoop.main)
            .map { pass in
                
                return pass.count > 7
            }
            .assign(to: \.passwordValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { pass in
                let pattern = "[A-Z]"
                let capitalLetter = pass.range(of: pattern, options: .regularExpression) != nil
                return capitalLetter
            }
            .assign(to: \.oneCapitalValid, on: self)
            .store(in: &cancellableSet)
        
        $confirmPassword
            .receive(on: RunLoop.main)
            .map { pass in
                return !self.password.isEmpty && self.password == pass
            }
            .assign(to: \.confirmPasswordValid, on: self)
            .store(in: &cancellableSet)
    }
}
