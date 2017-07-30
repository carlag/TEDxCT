//
//  TableViewDataSource.swift
//  TEDxCapeTown
//
//  Created by Carla on 2017/07/30.
//  Copyright © 2017 TEDxCapeTown. All rights reserved.
//

import Foundation
import UIKit

class TableDataSource<Item> : NSObject, UITableViewDataSource {
    
    var items : [Item]?
    var cellIdentifier : String?
    var configureCellBlock : ((UITableViewCell?, Item?)->())?
    
    init(items: [Item]?, cellIdentifier: String?, configureCellBlock: @escaping (UITableViewCell?, Item?)->()) {
        super.init()
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.configureCellBlock = configureCellBlock
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
        
        //cell.textLabel?.text = items?[indexPath.row]
        let item = items?[indexPath.row]
        
        self.configureCellBlock!(cell, item)
        
        return cell
    }
    
}
