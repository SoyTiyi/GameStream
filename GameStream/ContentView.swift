//
//  ContentView.swift
//  GameStream
//
//  Created by santiago.m on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color("marine")
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                    
                    LoginAndSignUp()
                    
                    
                    
                }
                
                
            }.navigationBarBackButtonHidden(true)
            
            
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
    @State var password: String = ""
    @State var isLogin: Bool = false
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading){
                
                Text("Email").foregroundColor(Color("dark-cian")).bold()
                
                ZStack (alignment: .leading){
                    
                    if email.isEmpty {
                        Text(verbatim:"gamestream@gmail.com").font(.caption).foregroundColor(Color("light-gray"))
                        
                    }
                    
                    TextField("", text: $email).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Password").foregroundColor(Color("dark-cian")).bold()
                
                ZStack (alignment: .leading) {
                    
                    if password.isEmpty {
                        Text(verbatim:"******").font(.caption).foregroundColor(Color("light-gray"))
                    }
                    
                    SecureField("", text: $password).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("¿Olvidaste tu constraseña?").font(.footnote).frame(width: 350, alignment: .trailing).foregroundColor(Color("dark-cian")).padding(.bottom)
                
                Button(action: {self.isLogin =  loginSesion()}) {
                    Text("LOGIN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"),lineWidth: 2.0).shadow(color: Color.white, radius: 6)).padding(.bottom, 50)
                }
                
                Text("Login with your social network").foregroundColor(Color.white).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                
                HStack(alignment: .center){
                    Button(action: {}) {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                    }
                    Button(action: {}) {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                    }
                }
                
                
                
                
                
                
            }.padding()
            
            NavigationLink(destination: Home(), isActive: $isLogin) {
                EmptyView()
            }
        }
        
    }
}

struct SingUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading){
                
                VStack(alignment: .center){
                    
                    Text("Choose your profile photo").foregroundColor(Color.white).frame(maxWidth: .infinity).fontWeight(.bold).padding(.bottom,3)
                    
                    Text("You can change your profile photo leter").foregroundColor(Color.gray).font(.footnote).padding(.bottom)
                    
                    ZStack {
                        
                        
                        
                        Button(action: {}) {
                            Image("image_profile").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100, alignment: .center).clipShape(Circle())
                                .shadow(radius: 3)
                                .overlay(Circle().stroke(Color("dark-cian"), lineWidth: 2))
                        }
                        
                        Image(systemName: "camera").foregroundColor(.white)
                        
                        
                    }
                    
                    
                    
                }
                
                VStack(alignment: .leading){
                    Text("Email").foregroundColor(Color("dark-cian")).bold()
                    
                    ZStack (alignment: .leading){
                        
                        if email.isEmpty {
                            Text(verbatim:"gamestream@gmail.com").font(.caption).foregroundColor(Color("light-gray"))
                            
                        }
                        
                        TextField("", text: $email)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                }
                
                VStack(alignment: .leading){
                    Text("Password").foregroundColor(Color("dark-cian")).bold()
                    
                    ZStack (alignment: .leading) {
                        
                        if password.isEmpty {
                            Text(verbatim:"******").font(.caption).foregroundColor(Color("light-gray"))
                        }
                        
                        SecureField("", text: $password)
                        
                    }
                    
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                }
                
                VStack(alignment: .leading){
                    Text("Confirm Password").foregroundColor(Color("dark-cian")).bold()
                    
                    ZStack (alignment: .leading) {
                        
                        if password.isEmpty {
                            Text(verbatim:"******").font(.caption).foregroundColor(Color("light-gray"))
                        }
                        
                        SecureField("", text: $password)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                }
                
                
                
                Button(action: {registerNewUser()}) {
                    Text("SIGNUP").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"),lineWidth: 2.0).shadow(color: Color.white, radius: 6)).padding(.bottom, 50)
                }
                
                VStack{
                    Text("Signup with your social network").foregroundColor(Color.white).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                    
                    HStack(alignment: .center){
                        Button(action: {}) {
                            Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                        }
                        Button(action: {}) {
                            Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                        }
                    }
                }
                
                
                
                
                
                
                
                
            }.padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func loginSesion() -> Bool{
    print("Login....")
    return true
    
}

func registerNewUser(){
    print("Registering new user...")
}
