//
//  TalksFlowController.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation
import UIKit

protocol TalksFlowControllerDelegate {
    func showTalkDetails(talk: Talk) -> Void
}

class TalksFlowController: FlowController, TalksFlowControllerDelegate {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let rootController = TalksViewController()
        rootController.flowDelegate = self
        // configure root controller
        // probably create a view model
        navigationController.show(rootController, sender: nil)
    }
    
    func showTalkDetails(talk: Talk) {
        
    }
}
