//
//  HomeView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/18/21.
//

import SwiftUI

struct HomeView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            
            // MARK: Heading and views
            
            TabView(selection: $model.showingSettings) {
                WidgetsView().tag(0)
                
                SettingsView().tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: model.screenSize.width, height: model.screenSize.height)
                .ignoresSafeArea()
                
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 10))
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 5)
                    .padding(.trailing, model.screenSize.width / 5)
                    .padding([.top], model.screenSize.width / 10)
                    .padding([.bottom], model.screenSize.width / 25)
                    .background(
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.bg, location: 0), .init(color: model.bg.opacity(0.01), location: 1)]), startPoint: .top, endPoint: .bottom))
                    )
                Spacer()
            }.ignoresSafeArea()
            
                
            // MARK: Navigation menu
            
            NavigationMenu()
        }.preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
