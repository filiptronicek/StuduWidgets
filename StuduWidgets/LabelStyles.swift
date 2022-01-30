//
//  LabelStyles.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/29/22.
//

import SwiftUI


// MARK: Button label

struct ButtonLabel: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(model.objectsClrDark)
                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                .cornerRadius(model.screenSize.width / 28)
        
            Text(text)
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 17))
                .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                .padding(.leading, model.screenSize.width / 1.5)
                .foregroundColor(.gray)
        }
    }
}


// MARK: Heading

struct Heading: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(model.objectsClrLight)
            .font(.system(size: model.screenSize.width / 15))
            .frame(width: model.screenSize.width / 1.2, alignment: .leading)
    }
}


// MARK: Title

struct Title: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(model.fontClr)
            .font(.system(size: model.screenSize.width / 12))
            .frame(width: model.screenSize.width / 1.12, alignment: .leading)
            .padding([.top, .bottom], model.screenSize.width / 18)
    }
}
