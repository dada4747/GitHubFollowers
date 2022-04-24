//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by admin on 23/04/22.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared   = NetworkManager()
    private let baseURL         = "https://api.github.com/users/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) ->Void ) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        // TODO: - Check URL validation
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        // TODO: - Request URL using URLSession
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
            // TODO: - Then inside the dataTask completion, we will handle the error and success data
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // TODO: - Decode data in try block
            
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
