//
//  ContentView.swift
//  NewApp_Product
//
//  Created by Enea Avdullai on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.175))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            VStack{
                Text("Accesso")
                    .foregroundColor(Color.green)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username: ", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                SecureField("Password: ", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                Button("Accedi")
                {
                    autenticazione(username: username, password: password)
                    
                }
                .foregroundColor(Color.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                
                NavigationLink(destination: Text("Accesso eseguito come @\(username)"), isActive: $showLoginScreen){
                    EmptyView()
                }
            }
        }
        .navigationBarHidden(true)
    }
    func autenticazione(username: String, password: String){
        if username == "user"{
            wrongUsername = 0
            if password == "1234"{
                wrongPassword = 0
                showLoginScreen = true
            }else{
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
