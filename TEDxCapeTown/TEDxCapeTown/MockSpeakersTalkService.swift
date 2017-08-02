//
//  MockSpeakerTalkService.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation

protocol SpeakersService {
    func fetchSpeakers(_ completion: @escaping (([Speaker]) -> Void))
}

class MockSpeakersService : SpeakersService {
    let delay: TimeInterval?
    let speakers: [Speaker]
    
    init(speakers: [Speaker] = MockSpeakersService.makeMockSpeakers(),
         delay: TimeInterval? = nil) {
        self.delay = delay
        self.speakers = speakers
    }
    
    func fetchSpeakers(_ completion: @escaping (([Speaker]) -> Void)) {
        if let delay = delay {
            let deadline = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
                guard let strongSelf = self else { return }
                completion(strongSelf.speakers)
            }
        } else {
            completion(speakers)
        }
    }
    
    static func makeMockSpeakers() -> [Speaker] {
        return [
            Speaker(name: "Carla Goldstein", title:"")
            
        ]
    }
}
