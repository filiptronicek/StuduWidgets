//
//  ContentModel.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/22/21.
//

import Foundation

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
        return data.result.token
    } catch {
        print(error.localizedDescription)
        return nil
    }
}
    
class ContentModel: ObservableObject {
    var timetable = "m"
}
