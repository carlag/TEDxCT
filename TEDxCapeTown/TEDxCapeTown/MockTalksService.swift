//
//  TalksService.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation

protocol TalksService {
    func fetchTalks(_ completion: @escaping (([Talk]) -> Void))
}

class MockTalksService : TalksService {
        let delay: TimeInterval?
        let talks: [Talk]
        
        init(talks: [Talk] = MockTalksService.makeMockTalks(),
        delay: TimeInterval? = nil) {
            self.delay = delay
            self.talks = talks
        }
        
        func fetchTalks(_ completion: @escaping (([Talk]) -> Void)) {
            if let delay = delay {
                let deadline = DispatchTime.now() + delay
                DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
                    guard let strongSelf = self else { return }
                    completion(strongSelf.talks)
                }
            } else {
                completion(talks)
            }
        }
        
        static func makeMockTalks() -> [Talk] {
            return [
                Talk(speakerName: "Carla Goldstein", title: "Women In Tech"),
                Talk(speakerName: "Carla Goldstein", title: "Women In Tech"),
                Talk(speakerName: "Carla Goldstein", title: "Women In Tech"),
                Talk(speakerName: "Carla Goldstein", title: "Women In Tech")

            ]
        }
}
