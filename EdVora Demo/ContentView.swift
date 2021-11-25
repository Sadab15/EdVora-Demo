//
//  ContentView.swift
//  customTextField
//
//  Created by Parth Asodariya on 24/11/21.
//

import SwiftUI

struct ContentView: View {

    @State var txtUsername: String = ""
    @State var txtPassword: String = ""
    @State var txtEmailAddress: String = ""
    @State private var showingAlert = false
    @State private var errorMessage : String = ""

    var body: some View {
        
        VStack(spacing: 10) {

            ScrollView{

                Image(imageNames.icon)
                    .frame(width: 120, height: 60, alignment: .center)
                    .padding(.bottom, 50)




                VStack{

                    customTextField(txt: $txtUsername, leftImageName: imageNames.userName, placeholderText: screenText.userName)

                    customTextField(txt: $txtPassword, leftImageName: imageNames.password, placeholderText: screenText.password, isRightDrawableVisible: true)

                    customTextField(txt: $txtEmailAddress, leftImageName: imageNames.email, placeholderText: screenText.email)

                    Text(screenText.forgotPassword)
                        .font(.caption)
                        .foregroundColor(Color.activeColor)
                        .frame(width: UIScreen.main.bounds.width - 50, alignment: .trailing)
                }

                Spacer()


                Button {
                    showingAlert = true
                    if checkValidation(){
                        UIApplication.shared.endEditing()
                        errorMessage = validationMessages.loginSuccess
                    }

                } label: {
                    Text(screenText.login)
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title3)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 12.0).foregroundColor(Color.btnColor))
                        .padding(.top, 40)
                }

                HStack {
                    Text(screenText.dontHaveAccount)
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    Text(screenText.signUp)
                        .foregroundColor(Color.activeColor)
                        .font(.subheadline)
                }
                .padding(.top, 40)

            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(""), message: Text(errorMessage), dismissButton: .default(Text(screenText.ok)) {
            })
        }
    }

 // this func used to check validation
    func checkValidation() -> Bool{
        if txtUsername.isEmpty{
            errorMessage = validationMessages.emptyUserName
            return false
        }else if txtPassword.isEmpty{
            errorMessage = validationMessages.emptyPassword
            return false
        }else if !txtPassword.matches(ValidationRegex.passwordRegex){
            errorMessage = validationMessages.invalidPassword
            return false
        }else if txtEmailAddress.isEmpty{
            errorMessage = validationMessages.emptyMail
            return false
        }else if !txtEmailAddress.matches(ValidationRegex.emailRegex){
            errorMessage = validationMessages.validMail
            return false
        }
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// custom textFeild
struct customTextField: View {

    @Binding var txt: String
    @State var isFocused: Bool = false
    @State var isSequreKey: Bool = false
    var leftImageName:String
    var placeholderText: String

    var isRightDrawableVisible: Bool = false

    var selectedColor: Color = Color.activeColor
    var defaultColor: Color = Color.lightGray

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(leftImageName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 17, height: 17, alignment: .leading)
                    .foregroundColor(.lightGray)
                if !isSequreKey{
                TextField(" ", text: $txt)
                    .font(.body)
                    .foregroundColor(Color.black)
                }else{
                SecureField(" ", text: $txt)
                    .font(.body)
                    .foregroundColor(Color.black)
                }
                if isRightDrawableVisible {
                    Image(isSequreKey ? imageNames.hidePass : imageNames.showPass)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 19, height: 14, alignment: .leading)
                        .foregroundColor(.lightGray)
                        .onTapGesture {
                           isSequreKey.toggle()
                        }
                }

                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 52, height: 50.0, alignment: .center)

            .background(RoundedRectangle(cornerRadius: 12.0)
                            .stroke(lineWidth: 1.5)
                            .foregroundColor(isFocused ? selectedColor : defaultColor)
                            .background(Color.txtFieldBG))

        }
        .onAppear(perform: {
            isSequreKey = placeholderText == screenText.password
        })
        .frame(width: UIScreen.main.bounds.width - 50, height: 70.0, alignment: .center)
        .onChange(of: txt, perform: { value in
            self.isFocused = !txt.isEmpty
        })
        .overlay(
            Text(" \(placeholderText) ")
                .font(.caption)
                .bold()
                .foregroundColor(.lightGray)
                .background(Color.white).opacity(1.0)
                .frame(width: UIScreen.main.bounds.width - 50, height: 64.0, alignment: .topLeading)
                .padding(.leading, 30)
                .padding(.horizontal, 13)
        )
    }
}
