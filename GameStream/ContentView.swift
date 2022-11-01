//
//  ContentView.swift
//  GameStream
//
//  Created by santiago.m on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {

            ZStack {
                
                Color(red: 36/255, green: 56/255, blue: 91/255, opacity: 1.0)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                    
                    LoginAndSignUp()
                    
                    
                    
                }
                                
                
            }
            
            
        }
    }
}

struct LoginAndSignUp: View{
    
    @State var isLogin = true
    
    
    var body: some View{
        
        VStack {
            HStack{
                
                Spacer()
                
                Button("LOGIN") {
                    isLogin = true
                }.foregroundColor(isLogin ? .white : .gray)
                
                Spacer()
                
                Button("SIGNUP") {
                    isLogin = false
                }.foregroundColor(!isLogin ? .white : .gray)
                
                Spacer()
                
            }
        }
        
        Spacer(minLength: 42)
        
        if isLogin {
            LoginView()
        } else {
            SingUpView()
        }
        
    }
}


struct LoginView: View {
    
    @State var email: String = ""
    
    var body: some View{
        
        VStack{
            
            Text("Email").foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
            
            TextField("gamestrem@gmail.com", text: $email).foregroundColor(Color.gray)
            
            Divider().foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0)).bold()
            
        
            
        }
        
    }
}

struct SingUpView: View {
    
    var body: some View{
        Text("Signup")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
