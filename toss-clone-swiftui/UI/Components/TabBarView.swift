//
//  TabBarView.swift
//  toss-clone-swiftui
//
//  Created by Collie on 2022/07/14.
//

import SwiftUI

struct TabBarView: View {
    let tabs: [TabType] = TabType.allCases
    
    @Binding var selectedTab: TabType
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Button {
                    self.selectedTab = tab
                } label: {
                    self.tabView(tab: tab)
                }
            }
        }
    }
}

extension TabBarView {
    private func tabView(tab: TabType) -> some View {
        VStack(spacing: 4) {
            Image(systemName: tab.imageName)
                .foregroundColor(selectedTab == tab ? .black : .gray)
            
            Text(tab.title)
                .font(.system(
                    size: 10,
                    weight: selectedTab == tab ? .semibold : .regular,
                    design: .rounded)
                )
                .foregroundColor(selectedTab == tab ? .black : .gray)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static var selectedTab: TabType = .home
    
    static var previews: some View {
        TabBarView(selectedTab: $selectedTab)
    }
}

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCornersShape(corners: corners, radius: radius) )
    }
}
