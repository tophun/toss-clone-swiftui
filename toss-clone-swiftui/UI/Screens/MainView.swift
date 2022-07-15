//
//  MainView.swift
//  toss-clone-swiftui
//
//  Created by Collie on 2022/07/14.
//

import SwiftUI

enum TabType: CaseIterable {
    case home
    case benefit
    case remit
    case stock
    case all
    
    var imageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .benefit:
            return "heart.fill"
        case .remit:
            return "paperplane.fill"
        case .stock:
            return "chart.bar.xaxis"
        case .all:
            return "list.bullet"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .benefit:
            return "혜택"
        case .remit:
            return "송금"
        case .stock:
            return "주식"
        case .all:
            return "전체"
        }
    }
}

struct MainView: View {
    @State var selectedTab: TabType = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .benefit:
                BenefitView()
            case .remit:
                RemitView()
            case .stock:
                StockView()
            case .all:
                AllView()
            }
            TabBarView(selectedTab: $selectedTab)
            .background {
                RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
