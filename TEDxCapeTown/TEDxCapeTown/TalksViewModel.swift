//
//  TalksViewModel.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation

class TalksViewModel : NSObject {
    
    var talks : [Talk] = []
    var reloadData : (()->())?
    
    init(reloadData: @escaping ()->()) {
        super.init()
        self.reloadData = reloadData;
        self.fetchTalks()
    }
    
    var networkManager: NetworkManager = MockNetworkManager()
    
    func numberOfItems() -> Int {
        return self.talks.count
    }
    
    func title(_ index:Int) -> String {
        var title = ""
        if let talkTitle = self.talks[index].title {
           title = talkTitle
        }
        return title
    }
    
    // MARK: Actions
    
    func fetchTalks() {
        networkManager.fetchTalks { [weak self] (talks) in
            self?.talks = talks
            self?.reloadData!()
        }
    }
    

}
