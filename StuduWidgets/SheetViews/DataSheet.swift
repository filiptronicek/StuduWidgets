//
//  DataSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/27/21.
//

import SwiftUI

struct DataSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()

            VStack {
                Title(text: "Data handling")

                ScrollView {
                    VStack {
                        HStack {
                            Spacer()

                            VStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 10)
                                    .foregroundColor(model.fontClr)

                                Text("User")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 25))
                            }

                            Group {
                                Spacer()

                                Rectangle()
                                    .fill(model.fontClr)
                                    .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 100)

                                Spacer()
                            }

                            VStack {
                                Image(systemName: "antenna.radiowaves.left.and.right.circle")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 10)
                                        .foregroundColor(model.fontClr)

                                Text("API")
                                    .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 25))
                            }

                            Group {
                                Spacer()

                                Rectangle()
                                    .fill(model.fontClr)
                                    .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 100)

                                    Spacer()
                            }

                            VStack {
                                Image(systemName: "icloud")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 15)
                                    .foregroundColor(model.fontClr)

                                Text("Server")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 25))
                            }

                            Spacer()
                        }.padding([.top, .bottom], model.screenSize.width / 15)

                    HStack {
                        Spacer()
                        Spacer()

                        VStack {
                            Image(systemName: "person.2")
                                .resizable()
                                .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 14)
                                .foregroundColor(model.fontClr)

                            Text("Us")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 25))
                        }.padding(.trailing, model.screenSize.width / 10.8)

                        Spacer()


                        Rectangle()
                            .fill(model.fontClr)
                            .frame(width: model.screenSize.width / 100, height: model.screenSize.width / 10)
                            .padding(.trailing, model.screenSize.width / 8)
                        }
                    }
                }
            }
        }
    }
}

struct DataSheet_Previews: PreviewProvider {
    static var previews: some View {
        DataSheet()
            .environmentObject(ContentModel())
    }
}

