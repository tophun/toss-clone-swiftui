//
//  MainView.swift
//  toss-clone-swiftui
//
//  Created by Collie on 2022/07/14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                        .labelStyle(.titleAndIcon)
                }
                .edgesIgnoringSafeArea(.top)
            
            BenefitView()
                .tabItem {
                    Label("혜택", systemImage: "heart.fill")
                        .labelStyle(.titleAndIcon)
                }
                .edgesIgnoringSafeArea(.top)
            
            RemitView()
                .tabItem {
                    Label("송금", systemImage: "paperplane.fill")
                        .labelStyle(.titleAndIcon)
                }
                .edgesIgnoringSafeArea(.top)
            
            StockView()
                .tabItem {
                    Label("주식", systemImage: "chart.bar.xaxis")
                        .labelStyle(.titleAndIcon)
                }
                .edgesIgnoringSafeArea(.top)
            
            AllView()
                .tabItem {
                    Label("전체", systemImage: "list.bullet")
                        .labelStyle(.titleAndIcon)
                }
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
