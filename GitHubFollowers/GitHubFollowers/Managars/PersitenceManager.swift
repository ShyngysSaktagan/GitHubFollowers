//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Shyngys Saktagan on 5/14/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import Foundation

enum PersitenceManagerKey {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Key {
        static let favorite = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersitenceManagerKey, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result{
            case .success(let followers):
                var retrivetFollowers = followers
                
                switch actionType {
                case .add:
                    guard !retrivetFollowers.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrivetFollowers.append(favorite)
                case .remove:
                    retrivetFollowers.removeAll {$0.login == favorite.login}
                }
                
                do {
                    let encoder = JSONEncoder()
                    let encodedFavorites = try encoder.encode(retrivetFollowers)
                    defaults.set(encodedFavorites, forKey: Key.favorite)
                    completed(nil)
                }catch {
                    completed(.unableToFavorite)
                }
            
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Key.favorite) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        }catch {
            completed(.failure(.unableToFavorite))
        } 
    }
}
