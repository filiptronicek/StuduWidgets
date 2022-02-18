//
//  FeedbackSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/5/22.
//

import SwiftUI

struct FeedbackSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        Heading(text: "Form")
                            .padding([.top], model.screenSize.width / 5)
                        
                        Rectangle()
                            .fill(model.objectsClrMedium)
                            .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding()
                        
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrMedium)
                                .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 8)
                                .cornerRadius(model.screenSize.width / 28)
                        
                            Text("Send")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 17))
                                .frame(width: model.screenSize.width / 1.6, height: model.screenSize.width / 8, alignment: .center)
                        }
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "Feedback")
                    
                    VStack() {
                        Button(action: { model.showingFeedbackSheet.toggle()},
                               label: {
                                    Text("Cancel")
                                        .padding([.bottom], model.screenSize.width / 25)
                        })
                    }.frame(width: model.screenSize.width / 1.15, alignment: .trailing)
                }
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct FeedbackSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSheet()
            .environmentObject(ContentModel())
    }
}
