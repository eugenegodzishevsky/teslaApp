//
//  MainView.swift
//  teslaApp
//
//  Created by Vermut xxx on 14.05.2024.
//

import SwiftUI

/// шлавный экран
struct MainView: View {
    // MARK: - Private Constants

    private enum Constants {
        static let teslaTitle = "Tesla"
        static let teslaDistanceString = "187 km"
        static let teslaImageName = "car"
        static let unlockString = "Unlock"
        static let lockString = "Lock"
        static let lockImageName = "lock.fill"
        static let unlockImageName = "lock.open.fill"
        static let backgroundColorString = "backgroundLight"
        static let profileImageName = "person"
        static let tagSelectedNumber = 1
        static let twoIndexNumber = 2
        static let buttonNumber = 5
    }
    
    @State var isCarClosed = false
    @State var isClimateShown = false
    @State var tagSelected = 0

    // MARK: - Public properties

    var body: some View {
        backgroundStackView(isLock: false) {
            VStack {
                headerView
                Spacer()
                carView
                controlPanelView
                navigationLinkView
                Spacer()
                    .frame(height: 40)
                closeCarControlView
                    .opacity(tagSelected == Constants.tagSelectedNumber ? 1 : 0)
                Spacer(minLength: 130)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // MARK: - Private properties

    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.teslaTitle)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(Constants.teslaDistanceString)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
            
            profileButtonView
        }
        .padding(.all, 25)
    }

    private var profileButtonView: some View {
        Button {} label: {
            Image(Constants.profileImageName)
                .neumorphismCircleButtonUnSelectedCircleStyle()
                .foregroundColor(.white)
        }
    }
    
    private var carView: some View {
        Image(Constants.teslaImageName)
            .resizable()
            .frame(height: 250)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 0, y: 10)
    }

    private var gradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }

    private var controlPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1 ..< 5) { index in
                Button {
                    if index == 2 {
                        isClimateShown.toggle()
                    }
                    withAnimation {
                        tagSelected = index
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .neumorphismUnSelectedCircleStyle()
                        .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color(Constants.backgroundColorString))
        )
        .neumorphismUnSelectedStyle()
    }

    private var navigationLinkView: some View {
        NavigationLink(isActive: $isClimateShown) {
            ClimateView()
        } label: {
            EmptyView()
        }
    }

    private var closeCarControlView: some View {
        Button {
            withAnimation {
                isCarClosed.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(isCarClosed ? Constants.lockString : Constants.unlockString)
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: isCarClosed ? Constants.unlockImageName : Constants.lockImageName)
                        .renderingMode(.template)
                        .neumorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color(Constants.backgroundColorString))
            )
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.colorScheme, .dark)
    }
}
