//
//  TimetableSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/19/21.
//

import SwiftUI

struct TimetableSheet: View {
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("Timetable Widget")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 5)
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
                                Text("Morning message")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 20))
                                    .padding(.trailing, screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the morning message
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(objectsClrMedium)
                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                .cornerRadius(15)
                            
                            HStack {
                                Text("Evening message")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 20))
                                    .padding(.trailing, screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the evening message
                            }
                        }
                        Button(action: {},
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(objectsClrMedium)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                            .cornerRadius(15)
                                        
                                        HStack {
                                            Text("Dividers")
                                                .foregroundColor(fontClr)
                                                .font(.system(size: screenSize.width / 20))
                                                .padding(.trailing, screenSize.width / 1.77)
                                        }
                                    }
                        })
                    }
                }
            }
        }
    }
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
    }
}
