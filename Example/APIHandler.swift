//
//  APIHandler.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/9/22.
//

import Foundation

class APIHandler {
    
    static let shared = APIHandler()
    
    private init () {}
    
//    func APICall(with teamName: String, completion: @escaping(Result<Data, Error>)->()){
//
//
//        guard let url = URL(string: Constant.searchURL.rawValue + "\(teamName)") else {return}
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        let headers = [
//            "X-RapidAPI-Key": "2223a5f96bmsh9e9b973ae718fe6p1002bejsn1c4be21420e3",
//            "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com"
//        ]
//        urlRequest.allHTTPHeaderFields = headers
//
//        URLSession.shared.dataTask(with: urlRequest) {[weak self] data, response, error in
//            guard let _ = self else {return}
//            if let error = error {
//                completion(.failure(error))
//            }
//
//            if let data = data {
//                completion(.success(data))
//            }
//        }.resume()
//    }
    
    func APICall2(completion: @escaping (Result<Data, Error>) ->()){

        guard let url = URL(string: Constant.baseURL.rawValue) else {return}
               var urlRequest = URLRequest(url: url)
               urlRequest.httpMethod = "GET"
               let headers = [
                   "X-RapidAPI-Key": "2223a5f96bmsh9e9b973ae718fe6p1002bejsn1c4be21420e3",
                   "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com"
               ]
               urlRequest.allHTTPHeaderFields = headers

               URLSession.shared.dataTask(with: urlRequest) {[weak self] data, response, error in
                   guard let _ = self else {return}
                   if let error = error {
                       completion(.failure(error))
                   }

                   if let data = data {
                       completion(.success(data))
                   }
               }.resume()
    }
    
}
