//
//  OnboardingView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/30/22.
//

import SwiftUI

struct OnboardingView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        Button(action: {model.onboardingShown = true},
               label: {
                    Text("Skip")
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
