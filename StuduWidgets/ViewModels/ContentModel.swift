//
//  ContentModel.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/22/21.
//

import Foundation
import SwiftUI
import Combine

class BakalariResponseData : Decodable, Identifiable, ObservableObject {

    var access_token : String
    var refresh_token : String
    var token_type : String
    var expires_in : Int64
    var scope : String
    var id_token : String?

    var bak_ApiVersion : String
    var bak_AppVersion : String
    var bak_UserId : String

    enum CodingKey: String {
        case access_token
        case refresh_token
        case token_type
        case expires_in
        case scope
        case id_token

        case bak_ApiVersion = "bak:ApiVersion"
        case bak_AppVersion = "bak:AppVersion"
        case bak_UserId = "bak:UserId"
    }
}


class ContentModel: ObservableObject {
    // MARK: Screen bounds

    let screenSize: CGRect = UIScreen.main.bounds
    
    
    // MARK: State variables
    
    @AppStorage("onboardingShown") var onboardingShown: Bool = false
    @Published var showingPrivacyPopUp: Bool = false
    
    @Published var showingSettings: Int = 0
    
    @Published var showingTimetableSheet: Bool = false
    @Published var showingLunchSheet: Bool = false
    
    @Published var showingDataSheet: Bool = false
    @Published var showingNewsSheet: Bool = false
    @Published var showingFeedbackSheet: Bool = false
    @Published var showingHelpSheet: Bool = false
    
    @Published var showingCustomizableWidgets: Bool = false
    
    @Published var showingLoginStrava: Bool = false
    @Published var showingLoginBakalari: Bool = false
    
    
    // MARK: UI colors
    
    @AppStorage("darkThemeState") var darkThemeIsActive: Bool = true
    @Published var bg = Color(red: 0.05, green: 0, blue: 0)
    @Published var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    @Published var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
    @Published var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
    @Published var objectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
    @Published var fontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    
    @Published var easterEggClr = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    
    
    // MARK: Widget colors
    
    @Published var Wbg = Color(red: 0.05, green: 0, blue: 0)
    @Published var WobjectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    @Published var WobjectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
    @Published var WobjectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
    @Published var WobjectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
    @Published var WfontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)
    @Published var WfontClr = Color(red: 1, green: 1, blue: 1)
    
    
    // MARK: Changing the color theme
    
    func changeColorTheme() {
        // Switch to light theme
        
        if !darkThemeIsActive {
            bg = Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255)
            objectsClrDark = Color(red: 228 / 255, green: 216 / 255, blue: 220 / 255)
            objectsClrMedium = Color(red: 201 / 255, green: 204 / 255, blue: 213 / 255)
            objectsClrLight = Color(red: 55 / 255, green: 125 / 255, blue: 161 / 255)
            fontClr = Color(red: 55 / 255, green: 125 / 255, blue: 161 / 255)
            easterEggClr = Color(red: 228 / 255, green: 216 / 255, blue: 220 / 255)
        } else {
            // Switch back to dark theme
            
            bg = Color(red: 0.05, green: 0, blue: 0)
            objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
            objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
            objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
            fontClr = Color(red: 1, green: 1, blue: 1)
            easterEggClr = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
        }
    }
    
    
    // MARK: Getting strava.cz data
    
    @Published var currentLunch: String = "Login to your Strava.cz account first"
    
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
        var errorMessage: String?
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

            if (data.status == "success") {
                currResult.token = data.result.token
                currResult.displayName = "\(data.result.user.Jmeno) \(data.result.user.Prijmeni)".capitalized
                return currResult
            } else {
                currResult.ok = false
                // ToDo(ft): add dynamic error message returned by the server
                currResult.errorMessage = "API Error"
                return currResult
            }
        } catch {
            print(error)
            currResult.ok = false
            currResult.errorMessage = error.localizedDescription
            return currResult
        }
    }
    
    
    // MARK: Getting bakalari.cz data
    
    struct BakalariTokenResult {
        var ok: Bool
        var accessToken: String?
        var refreshToken: String?
        var displayName: String?
        var errorMessage: String?
    }
    
    
    func getBakalariToken (username: String, password: String, endpoint: String, userCompletionHandler: @escaping (BakalariTokenResult?, Error?) -> Void) {

        struct ErrorResponse: Decodable {
            var error: String
            var error_description: String
        }

        var currResult = BakalariTokenResult(ok: true, accessToken: nil, refreshToken: nil, displayName: nil)
        
        let urlSession = URLSession(configuration: .default)
        let requestHeaders: [String:String] = ["Content-Type" : "application/x-www-form-urlencoded"]
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "ANDR"),
            URLQueryItem(name: "grant_type", value: "password"),
            URLQueryItem(name: "username", value: username),
            URLQueryItem(name: "password", value: password)
        ]
        
        var request = URLRequest(url: URL(string: "https://\(endpoint)/api/login")!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)

        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])

            print("💁🏻‍♂️ \(String(describing: statusCode))")
            if (statusCode == 400) {
                currResult.ok = false
                if let responseJSON = responseJSON as? ErrorResponse {
                    currResult.errorMessage = "\(responseJSON.error_description) (\(responseJSON.error))"
                    userCompletionHandler(currResult, nil)
                } else {
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    currResult.errorMessage = responseJSON!["error_description"] as? String ?? "Unknown error"
                    userCompletionHandler(currResult, nil)
                }
            } else if (statusCode == 200) {
                // Skip type check
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                currResult.accessToken = responseJSON!["access_token"] as? String
                currResult.refreshToken = responseJSON!["refresh_token"] as? String
                currResult.displayName = responseJSON!["bak:UserId"] as? String
                userCompletionHandler(currResult, nil)
                /*
                if let responseJSON = responseJSON as? BakalariResponseData {
                    currResult.accessToken = responseJSON.access_token
                    currResult.refreshToken = responseJSON.refresh_token
                    currResult.displayName = responseJSON.scope
                    userCompletionHandler(currResult, nil)
                }
                */
            }
        }

        task.resume()
    }


    struct BakalariSingleCity {
        var name: String
        var totalCount: Int
    }
    

    struct BakalariSingleCityResult {
        var ok: Bool
        var errorMessage: String?
        var city: [BakalariSingleCity]?
    }

    /**
      Function to fetch all cities from the Bakaláři API (GET https://sluzby.bakalari.cz/api/v1/municipality).
      The request must only accept JSON data.
      - Returns: Array of all cities, their `name` and `schoolCount`
    */
    
    func getCities (userCompletionHandler: @escaping (BakalariSingleCityResult?, Error?) -> Void) {

        struct ErrorResponse: Decodable {
            var error: String
            var error_description: String
        }

        let urlSession = URLSession(configuration: .default)
        let requestHeaders: [String:String] = ["Content-Type" : "application/json"]
        
        var request = URLRequest(url: URL(string: "https://sluzby.bakalari.cz/api/v1/municipality")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestHeaders

        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                userCompletionHandler(nil, error)
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])

            print("💁🏻‍♂️ \(String(describing: statusCode))")
            if (statusCode == 400) {
                if let responseJSON = responseJSON as? ErrorResponse {
                    print("\(responseJSON.error_description) (\(responseJSON.error))")
                } else {
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    let error_description = (responseJSON!["error_description"] as? String ?? "Unknown error")
                    let response = BakalariSingleCityResult(ok: false, errorMessage: error_description, city: nil)
                    userCompletionHandler(response, nil)
                }
            } else if (statusCode == 200) {
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let cities
                    = responseJSON!["data"] as! [[String:Any]]
                var cityArray = [BakalariSingleCity]()
                for city in cities {
                    let cityName = city["name"] as! String
                    let schoolCount = city["schoolCount"] as! Int
                    cityArray.append(BakalariSingleCity(name: cityName, totalCount: schoolCount))
                }
                var response = BakalariSingleCityResult(ok: true, errorMessage: nil, city: cityArray)
                userCompletionHandler(response, nil)
            }
        }
        task.resume()
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
        
        @Published var bakalariUsername: String {
            didSet {
                UserDefaults.standard.set(bakalariUsername, forKey: "bakalariUsername")
            }
        }
        
        @Published var bakalariPassword: String {
            didSet {
                UserDefaults.standard.set(bakalariPassword, forKey: "bakalariPassword")
            }
        }
        
        @Published var bakalariEndpoint: String {
            didSet {
                UserDefaults.standard.set(bakalariEndpoint, forKey: "bakalariEndpoint")
            }
        }

        @Published var bakalariAccessToken: String {
            didSet {
                UserDefaults.standard.set(bakalariAccessToken, forKey: "bakalariAccessToken")
            }
        }
        
        @Published var bakalariRefreshToken: String {
            didSet {
                UserDefaults.standard.set(bakalariRefreshToken, forKey: "bakalariRefreshToken")
            }
        }
        
        init() {
            self.stravaUsername = UserDefaults.standard.object(forKey: "stravaUsername") as? String ?? ""
            self.stravaPassword = UserDefaults.standard.object(forKey: "stravaPassword") as? String ?? ""
            self.stravaCanteen = UserDefaults.standard.object(forKey: "stravaCanteen") as? String ?? ""
            self.stravaDisplayName = UserDefaults.standard.object(forKey: "stravaDisplayName") as? String ?? "Tronislav Rostíček"
            self.stravaToken = UserDefaults.standard.object(forKey: "stravaToken") as? String ?? ""
            self.bakalariUsername = UserDefaults.standard.object(forKey: "bakalariUsername") as? String ?? "Rostislav Troníček"
            self.bakalariPassword = UserDefaults.standard.object(forKey: "bakalariPassword") as? String ?? ""
            self.bakalariEndpoint = UserDefaults.standard.object(forKey: "bakalariEndpoint") as? String ?? ""
            self.bakalariAccessToken = UserDefaults.standard.object(forKey: "bakalariAccessToken") as? String ?? ""
            self.bakalariRefreshToken = UserDefaults.standard.object(forKey: "bakalariRefreshToken") as? String ?? ""
        }
    }
    
    
    // MARK: Timetable data storage
    
    let timetable: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
}
