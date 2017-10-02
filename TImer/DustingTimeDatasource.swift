//
//  DustingTimeDatasource.swift
//  TImer
//
//  Created by RoviSys on 9/26/17.
//  Copyright © 2017 RoviSys. All rights reserved.

import LBTAComponents

struct DustingTimeModel {
    var location: String?
}

class DustingTimeDatasource: Datasource {
    
    let test: [Int] = [1,2]
    
//    let events: [Event] = {
//        let tomEvent = Event(title: "Tom's First Event", creator: "Tom Fritz", username: "Atticus08", profileImage: #imageLiteral(resourceName: "firstEvent"), coverImage: #imageLiteral(resourceName: "firstEvent"), photoCount: 100, dateCreated: "7/2/2017")
//        return [tomEvent]
//    }()
    
    // MARK: - Datasource Functions
    
//    override func headerClasses() -> [DatasourceCell.Type]? {
//        return HomeUserHeader.self
//    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [DustingTimerCell.self]
    }
    
    // This method runs the datasource items laid out in the cells
    override func item(_ indexPath: IndexPath) -> Any? {
        return 1
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
}
