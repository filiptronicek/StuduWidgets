//
//  DataSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/27/21.
//

import SwiftUI

struct DataSheet: View {
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()

            VStack {
                Text("Learn how your data is handled...")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 10.9)
                    .padding([.top, .bottom], screenSize.width / 18)

                ScrollView {
                    VStack {
                        HStack {
                            Spacer()

                            VStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: screenSize.width / 10, height: screenSize.width / 10)
                                    .foregroundColor(fontClr)

                                Text("User")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 25))
                            }

                            Group {
                                Spacer()

                                Rectangle()
                                    .fill(fontClr)
                                    .frame(width: screenSize.width / 10, height: screenSize.width / 100)

                                Spacer()
                            }

                            VStack {
                                Image(systemName: "antenna.radiowaves.left.and.right.circle")
                                        .resizable()
                                        .frame(width: screenSize.width / 10, height: screenSize.width / 10)
                                        .foregroundColor(fontClr)

                                Text("API")
                                        .foregroundColor(fontClr)
                                        .font(.system(size: screenSize.width / 25))
                            }

                            Group {
                                Spacer()

                                Rectangle()
                                    .fill(fontClr)
                                    .frame(width: screenSize.width / 10, height: screenSize.width / 100)

                                    Spacer()
                            }

                            VStack {
                                Image(systemName: "icloud")
                                    .resizable()
                                    .frame(width: screenSize.width / 10, height: screenSize.width / 15)
                                    .foregroundColor(fontClr)

                                Text("Server")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 25))
                            }

                            Spacer()
                        }.padding([.top, .bottom], screenSize.width / 15)

                    HStack {
                        Spacer()
                        Spacer()

                        VStack {
                            Image(systemName: "person.2")
                                .resizable()
                                .frame(width: screenSize.width / 10, height: screenSize.width / 14)
                                .foregroundColor(fontClr)

                            Text("Us")
                                .foregroundColor(fontClr)
                                .font(.system(size: screenSize.width / 25))
                        }.padding(.trailing, screenSize.width / 10.8)

                        Spacer()


                        Rectangle()
                            .fill(fontClr)
                            .frame(width: screenSize.width / 100, height: screenSize.width / 10)
                            .padding(.trailing, screenSize.width / 8)
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
    }
}
