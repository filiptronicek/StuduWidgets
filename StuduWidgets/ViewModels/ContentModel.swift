//
//  ContentModel.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/22/21.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    // MARK: SCREEN SIZE BOUNDS

    let screenSize: CGRect = UIScreen.main.bounds
    
    
    // MARK: STATE VARIABLES
    
    @Published var showingSettings:Bool = false
    
    @Published var showingTimetableSheet:Bool = false
    @Published var showingLunchSheet:Bool = false
    
    @Published var showingDataSheet:Bool = false
    @Published var showingNewsSheet:Bool = false
    
    @Published var showingCustomizableWidgets:Bool = false
    
    @Published var showingLoginStrava:Bool = false
    @Published var showingLoginBakalari:Bool = false
    
    @Published var isSignedInToBakalari:Bool = false
    @Published var isSignedInToStrava:Bool = false
    
    
    // MARK: UI COLORS
    
    @AppStorage("darkThemeState") var darkThemeIsActive:Bool = true
    @Published var bg = Color(red: 0.05, green: 0, blue: 0)
    @Published var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    @Published var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
    @Published var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
    @Published var objectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
    @Published var fontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    
    
    // MARK: CHANGING THE COLOR THEME
    
    func changeColorTheme() {
        // Switch to light theme
        
        if darkThemeIsActive == false {
            bg = Color(red: 1, green: 1, blue: 1)
            objectsClrDark = Color(red: 0.6, green: 0.6, blue: 0.6)
            objectsClrMedium = Color(red: 0.7, green: 0.7, blue: 0.7)
            objectsClrLight = Color(red: 0.8, green: 0.8, blue: 0.8)
            fontClr = Color(red: 0.05, green: 0, blue: 0)
        }
        
        
        // Switch back to dark theme
        
        if darkThemeIsActive == true {
            bg = Color(red: 0.05, green: 0, blue: 0)
            objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
            objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
            objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
            fontClr = Color(red: 1, green: 1, blue: 1)
        }
    }
    
    
    // MARK: GETTING STRAVA.CZ TOKEN
    
    func fetchAPI<D: Decodable>(url: URL) async throws -> D {
        let task = Task { () -> D in
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(D.self, from: data)
            return decodedData
        }
        return try await task.value
    }

    let endpoint = "https://strava-api.vercel.app/api"

    // TODO - linking to the API
    func getStravaToken (username: String, password: String, canteen: String) async -> String? {
        
        struct Result: Decodable {
            var token: String
        }
        
        struct Response: Decodable {
           var status: String
           var result: Result
        }
        
        do {
            let url = URL(string: "\(endpoint)/auth/token?username=\(username)&password=\(password)&canteen=\(canteen)")
            guard let requestUrl = url else { fatalError() }
            let data: Response = try await fetchAPI(url: requestUrl)
            if (data.status == "success") {
                return data.result.token
            } else {
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    // MARK: Getting timetable
    
    var timetableMonday: [String] = ["Eh", "Eh", "M", "Nj", "Aj", "Cj"]
    var timetableTuesday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    var timetableWednesday: [String] = ["F", "Nj", "M", "Cj", "Zsv", "Bi", "Z"]
    var timetableThursday: [String] = ["Tv", "Ivt", "Ivt", "Aj", "Aj", "Z", "Ch"]
    var timetableFriday: [String] = ["Bi", "D", "Zsv", "M", "Cj", "Nj"]
}
