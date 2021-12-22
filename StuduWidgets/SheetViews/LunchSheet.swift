//
//  LunchSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/20/21.
//

import SwiftUI

struct LunchSheet: View {
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("Lunch Widget")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 3)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                ScrollView {
                    VStack {
                        HStack {
                              Spacer()
                              
                              Text("Customization")
                                  .foregroundColor(objectsClrLight)
                                  .font(.system(size: screenSize.width / 15))
                              
                              Spacer()
                              Spacer()
                              Spacer()
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(objectsClrMedium)
                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                .cornerRadius(15)
                            
                            HStack {
                                Text("Layout")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 20))
                                    .padding(.trailing, screenSize.width / 1.655)
                                
                                //TODO Textfield for input of the morning message
                            }
                        }
                    }
                }
                
                Text("Swipe down")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 18))
            }
        }
    }
}

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
    }
}
