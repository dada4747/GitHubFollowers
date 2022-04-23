//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by admin on 23/04/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) ->Void ) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        // make sure valid url
        guard let url = URL(string: endPoint) else {
            
            // - if does'nt return valid url
            completed(.failure(.invalidUsername))
            return
        }
        
        // - url session data task to actually get data task from url
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // - handle the error
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            // - handle the response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // - store response into data
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                // convert from snak case to camelcase / object
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // - decode and create array of follower from data
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
