//
//  SpeakersFlowController.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation
import UIKit

protocol SpeakersViewControllerFlowDelegate: class {
    func showSpeakerDetail(speaker: Speaker) -> Void
}

class SpeakersFlowController: FlowController, SpeakersViewControllerFlowDelegate {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let rootController = SpeakersViewController()
        rootController.flowDelegate = self
        // configure root controller
        // probably create a view model
        navigationController.show(rootController, sender: nil)
    }
    
    func showSpeakerDetail(speaker: Speaker) {
        let speakerDetailVC = SpeakerDetailViewController()
        speakerDetailVC.viewModel = SpeakerDetailViewModel(speaker: speaker)
        speakerDetailVC.flowDelegate = self
        navigationController.show(speakerDetailVC, sender: nil)
    }
}
