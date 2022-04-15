//
//  RecipeAPIManager.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation
import Alamofire

class RecipeAPIManager {
    // singleton manager
    static let shared = RecipeAPIManager()
    private init() {}
    
    // result
    enum ResultOfObject {
       case success(object: SearchResponse?)
       case failure(error: String)
    }
    
    // search response
    func getSearchResponse(searchText: String, filter: HealthFilter, completion: @escaping (_ result: ResultOfObject) -> ()) {
        
        var components = URLComponents(string: BASE_URL)
        components?.path = EndPoints.search
        components?.queryItems = [
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "app_id", value: RECIPE_API_APP_ID),
            URLQueryItem(name: "app_key", value: RECIPE_API_APP_KEY),
            URLQueryItem(name: "q", value: searchText),
        ]
        
        if filter != .ALL {
            let healthQuery = URLQueryItem(name: "health", value: filter.query)
            components?.queryItems?.append(healthQuery)
        }
        
        guard let url = components?.url else { return }
        let headers: HTTPHeaders = ["Content-type": "application/json"]
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: SearchResponse.self) { response in
            switch response.result {
                
            case .success(let data):
                print("=> \(url)")
                print("✅ Request succeed")
                completion(.success(object: data))

            case .failure(let error):
                print("=> \(url)")
                print("🛑 Request is failed")
                completion(.failure(error: error.localizedDescription))
            }
        }
        
    }
}
