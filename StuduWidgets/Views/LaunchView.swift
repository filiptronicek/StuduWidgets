//
//  LaunchView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/30/22.
//

import SwiftUI

struct LaunchView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if model.onboardingShown == false {
            OnboardingView()
        }
        
        else {
            HomeView()
                .onAppear(perform: model.changeColorTheme)
        }
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
