//
//  Constant.swift
//  EdVora
//
//  Created by differenz242 on 25/11/21.
//

import Foundation
import SwiftUI

extension Color{
    static let txtFieldBG = Color(#colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1)) // #FAFAFA
    static let activeColor = Color(#colorLiteral(red: 0.811149776, green: 0.6576647162, blue: 0.6710232496, alpha: 1)) // #C3969B
    static let lightGray = Color(#colorLiteral(red: 0.7506764531, green: 0.7506943345, blue: 0.7506847978, alpha: 1)) //#B2B2B2
    static let btnColor = Color(#colorLiteral(red: 0.5259113908, green: 0.31337744, blue: 0.349042058, alpha: 1)) //#723D47
}

struct imageNames {
    static let icon = "icon"
    static let userName = "user"
    static let password = "password"
    static let email = "email"
    static let hidePass = "hidePass"
    static let showPass = "showPass"
}


struct screenText {
    static let userName = "Username"
    static let password = "Password"
    static let email = "Email address"
    static let forgotPassword = "Forgotten Password?"
    static let login = "LOGIN"
    static let dontHaveAccount = "Don't have an account?"
    static let signUp = "Sign up"
    static let ok = "Ok"
}

struct validationMessages {
    static let emptyUserName            = "Please enter username."
    static let emptyMail                = "Please enter email address."
    static let validMail                = "Please enter valid email address."
    static let emptyPassword            = "Please enter password."
    static let invalidPassword          = "Password must contain at least Minimum 8 characters, 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character."
    static let loginSuccess          = "Login Succefully."
}

struct ValidationRegex {

    static let nameRegex = "^[A-Za-z0-9 ]+$"
    static let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
