//
//  Home.swift
//  GameStream
//
//  Created by santiago.m on 4/11/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var selectedTab : Int = 2
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            
            Text("Profile View").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person").foregroundColor(Color.white)
                Text("Profile")
            }.tag(0)
            
            Games().font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller").foregroundColor(Color.white)
                Text("Games")
            }.tag(1)
            
            HomeView().tabItem {
                Image(systemName: "house").foregroundColor(Color.white)
                Text("Home")
            }.tag(2)
            
            Text("Favorites View").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart").foregroundColor(Color.white)
                Text("Favorites")
            }.tag(3)
            
        }.accentColor(Color("dark-cian"))
        
        
    }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("tab-bar-color"))
        UITabBar.appearance().backgroundColor = UIColor(Color("tab-bar-color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
    }
}

struct HomeView: View {
    
    @State var gameName: String = ""
    
    var body: some View{
        
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack{
                
                Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 25.0)
                
                HStack{
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass").foregroundColor( gameName.isEmpty ? Color(.gray) : Color("dark-cian"))
                    }
                    
                    ZStack{
                        
                        if(gameName.isEmpty){
                            Text("Search Game").foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        TextField("", text: $gameName).foregroundColor(.white)
                        
                    }
                    
                    
                }.padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16)).background(Color("blue-gray")).cornerRadius(15)
                
                
                
                ScrollView {
                    PrincipalVideoModule()
                    
                    CategoriesModule()
                    
                    RecommendedForYouModule()
                }
                
            }.padding(.horizontal, 18)
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
}



struct PrincipalVideoModule : View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    
    
    
    var body: some View{
        VStack{
            
            Text("THE MOST POPULAR").font(.title2).frame(maxWidth: .infinity, alignment: .leading).fontWeight(.bold).foregroundColor(.white)
            
            VStack{
                
                ZStack{
                    
                    Button(action: {
                        url = urlVideos[0]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        VStack(spacing: 0){
                            
                            ZStack {
                                Image("TheWitcher3").resizable().frame(width: .infinity, height: 200, alignment: .center)
                                Image(systemName: "play.circle.fill").resizable().frame(width: 50, height: 50, alignment: .center).foregroundColor(.white)
                            }
                            
                            Text("  The witcher 3: Wild Hunt").frame(minWidth: 0,maxWidth: .infinity, minHeight: 40 , alignment: .leading).font(.title3).bold().background(Color("blue-gray")).foregroundColor(.white)
                        }
                    }
                    
                    
                    
                }
                
            }
            
            NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: self.url)!)), isActive: $isPlayerActive) {
                EmptyView()
            }
        }.padding(EdgeInsets(top: 15, leading: 4, bottom: 0, trailing: 4))
    }
    
}

struct CategoriesModule : View {
    
    var body: some View{
        
        VStack{
            
            Text("SUGGESTED CATEGORIES FOR YOU").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).font(.title3).bold().foregroundColor(.white).padding(.vertical)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {}) {
                        
                        VStack{
                            
                            Image("Vector-shot").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .center).padding(.bottom,8)
                            
                            Text("FPS").font(.title2).bold().foregroundColor(Color("dark-cian"))
                            
                        }.frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 18, leading: 75, bottom: 18, trailing: 75)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                        
                    }
                    
                    Button(action: {}) {
                        
                        VStack{
                            
                            Image("rpg-icon").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .center).padding(.bottom,8)
                            
                            Text("RPG").font(.title2).bold().foregroundColor(Color("dark-cian"))
                            
                        }.frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 18, leading: 75, bottom: 18, trailing: 75)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                        
                    }
                    
                    Button(action: {}) {
                        
                        VStack{
                            
                            Image("open-world-icon").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .center).padding(.bottom,8)
                            
                            Text("OW").font(.title2).bold().foregroundColor(Color("dark-cian"))
                            
                        }.frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 18, leading: 75, bottom: 18, trailing: 75)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("blue-gray"),lineWidth: 2.0)).background(Color("blue-gray"))
                        
                    }

                    
                }
                
                
            }
            
            
            
        }.padding(EdgeInsets(top: 15, leading: 4, bottom: 0, trailing: 4))
        
    }
    
}

struct RecommendedForYouModule : View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        VStack{
            Text("RECOMMENDED FOR YOU").font(.title3).bold().foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    Button(action: {}) {
                        Image("GTA").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 150, alignment: .center)
                    }
                    
                    Button(action: {}) {
                        Image("CRASH").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 150, alignment: .center)
                    }
                    
                    Button(action: {}) {
                        Image("CUPHEAD").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 150, alignment: .center)
                    }
                }
                
            }
            
            
        }.padding(.vertical)
        
        
        
        
        
        
    }
    
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
