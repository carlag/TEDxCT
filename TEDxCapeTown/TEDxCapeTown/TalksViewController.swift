//
//  SecondViewController.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/26.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import UIKit

class TalksViewController: UIViewController {
    
    
    var cellIdentifier = "talksTableViewCell"
    
    @IBOutlet weak var talksTableView: UITableView!
    
    var talksViewModel : TalksViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        talksTableView.dataSource = self
        talksTableView.delegate = self
        
        self.talksViewModel = TalksViewModel(reloadData: {
            self.talksTableView.reloadData()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension TalksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.talksViewModel!.numberOfItems()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.talksViewModel?.title(indexPath.row)
        
        return cell
    }
    
}
