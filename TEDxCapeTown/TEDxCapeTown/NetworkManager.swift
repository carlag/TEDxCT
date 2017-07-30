//
//  NetworkManager.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation

protocol NetworkManager {
    func fetchTalks(_ completion: @escaping (([Talk]) -> Void))
  
}

class MockNetworkManager: NetworkManager {
    let talkService : TalksService = MockTalksService(delay: 1.5)
    
    func fetchTalks(_ completion: @escaping (([Talk]) -> Void)) {
        talkService.fetchTalks { talks in
            completion(talks)
        }
    }
    
}
