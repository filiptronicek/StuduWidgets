//
//  ContentModel.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/22/21.
//

import Foundation
import SwiftUI
import Combine

class ContentModel: ObservableObject {
    // MARK: Screen bounds

    let screenSize: CGRect = UIScreen.main.bounds
    
    
    // MARK: State variables
    
    @AppStorage("onboardingShown") var onboardingShown:Bool = false
    @Published var showingPrivacyPopUp:Bool = false
    
    @Published var showingSettings:Bool = false
    
    @Published var showingTimetableSheet:Bool = false
    @Published var showingLunchSheet:Bool = false
    
    @Published var showingDataSheet:Bool = false
    @Published var showingNewsSheet:Bool = false
    @Published var showingTermsSheet:Bool = false
    @Published var showingHelpSheet:Bool = false
    
    @Published var showingCustomizableWidgets:Bool = false
    
    @Published var showingLoginStrava:Bool = false
    @Published var showingLoginBakalari:Bool = false
    
    @Published var isSignedInToBakalari:Bool = false
    @Published var isSignedInToStrava:Bool = false
    
    
    // MARK: UI colors
    
    @AppStorage("darkThemeState") var darkThemeIsActive:Bool = true
    @Published var bg = Color(red: 0.05, green: 0, blue: 0)
    @Published var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    @Published var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
    @Published var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
    @Published var objectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
    @Published var fontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    
    @Published var easterEggClr = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    
    
    // MARK: Changing the color theme
    
    func changeColorTheme() {
        // Switch to light theme
        
        if darkThemeIsActive == false {
            bg = Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255)
            objectsClrDark = Color(red: 228 / 255, green: 216 / 255, blue: 220 / 255)
            objectsClrMedium = Color(red: 201 / 255, green: 204 / 255, blue: 213 / 255)
            objectsClrLight = Color(red: 1, green: 1, blue: 1)
            fontClr = Color(red: 55 / 255, green: 125 / 255, blue: 161 / 255)
            easterEggClr = Color(red: 228 / 255, green: 216 / 255, blue: 220 / 255)
        }
        
        
        // Switch back to dark theme
        
        if darkThemeIsActive == true {
            bg = Color(red: 0.05, green: 0, blue: 0)
            objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
            objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
            objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
            fontClr = Color(red: 1, green: 1, blue: 1)
            easterEggClr = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
        }
    }
    
    
    // MARK: Getting strava.cz token
    
    func fetchAPI<D: Decodable>(url: URL) async throws -> D {
        let task = Task { () -> D in
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(D.self, from: data)
            return decodedData
        }
        return try await task.value
    }

    let endpoint = "https://strava-api.vercel.app/api"

    struct StravaTokenResult {
        var ok: Bool
        var token: String?
        var displayName: String?
    }
    
    func getStravaToken (username: String, password: String, canteen: String) async -> StravaTokenResult {
        
        struct User: Decodable {
            let ElektronickaStravenkarka, TextProRegistrovaneUzivatele, DelkaNecinnosti, ElektronickaStravenkarkaPovolena: String
            let FunkceTlacitkaOdeslat, SbalitSkupiny, AktivaceHesla, EvCislo: String
            let Prijmeni, Jmeno, Prezdivka, Trida: String
            let IdMedium1, IdMedium2, IdMedium3, IdMedium1Dual: String?
            let IdMedium2Dual, IdMedium3Dual, EMail1, EMail2: String?
            let VS, ParovaciID, UpozorneniProObjednavani, ZobrazeniPodrobnostiUzivatele: String
            let PodrobnostiStravnika1, PodrobnostiStravnika2, TypDialogu, AutomatickyRozbalitVM: String
            let Jazyk, Mena, KontaktNazevJidelny, KontaktAdresa: String
            let KontaktPSC, KontaktMesto, KontaktCisloUctu, KontaktSmerovyKodBanky: String
            let KontaktTelefon, KontaktMobil, KontaktEMail, KontaktWww: String
            let ObjDatumOd, ObjDatumDo, Blokace, CasAktualizace: String
            let VerzeStravne, ZobrazitVydej, ZobrazitPoctyJidel, PovolitHodnoceni: String
        }
        
        struct Result: Decodable {
            var token: String
            var user: User
        }
        
        struct Response: Decodable {
           var status: String
           var result: Result
        }
        
        var currResult = StravaTokenResult(ok: true, token: nil, displayName: nil)
        
        do {
            let url = URL(string: "\(endpoint)/auth/token?username=\(username)&password=\(password)&canteen=\(canteen)")
            guard let requestUrl = url else { fatalError() }
            let data: Response = try await fetchAPI(url: requestUrl)
            print(data)

            if (data.status == "success") {
                currResult.token = data.result.token
                currResult.displayName = "\(data.result.user.Jmeno) \(data.result.user.Prijmeni)".capitalized
                return currResult
            } else {
                currResult.ok = false
                return currResult
            }
        } catch {
            print(error)
            currResult.ok = false
            return currResult
        }
    }

    class UserSettings: ObservableObject {
        @Published var stravaUsername: String {
            didSet {
                UserDefaults.standard.set(stravaUsername, forKey: "stravaUsername")
            }
        }
        
        @Published var stravaPassword: String {
            didSet {
                UserDefaults.standard.set(stravaPassword, forKey: "stravaPassword")
            }
        }
        
        @Published var stravaCanteen: String {
            didSet {
                UserDefaults.standard.set(stravaCanteen, forKey: "stravaCanteen")
            }
        }
        
        @Published var stravaDisplayName: String {
            didSet {
                UserDefaults.standard.set(stravaDisplayName, forKey: "stravaDisplayName")
            }
        }

        @Published var stravaToken: String? {
            didSet {
                UserDefaults.standard.set(stravaToken, forKey: "stravaToken")
            }
        }
        
        init() {
            self.stravaUsername = UserDefaults.standard.object(forKey: "stravaUsername") as? String ?? ""
            self.stravaPassword = UserDefaults.standard.object(forKey: "stravaPassword") as? String ?? ""
            self.stravaCanteen = UserDefaults.standard.object(forKey: "stravaCanteen") as? String ?? ""
            self.stravaDisplayName = UserDefaults.standard.object(forKey: "stravaDisplayName") as? String ?? ""
            self.stravaToken = UserDefaults.standard.object(forKey: "stravaToken") as? String ?? ""
        }
    }

    // MARK: Getting timetable data
    
    var timetableMonday: [String] = ["Eh", "Eh", "M", "Nj", "Aj", "Cj"]
    var timetableTuesday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    var timetableWednesday: [String] = ["F", "Nj", "M", "Cj", "Zsv", "Bi", "Z"]
    var timetableThursday: [String] = ["Tv", "Ivt", "Ivt", "Aj", "Aj", "Z", "Ch"]
    var timetableFriday: [String] = ["Bi", "D", "Zsv", "M", "Cj", "Nj"]
}
