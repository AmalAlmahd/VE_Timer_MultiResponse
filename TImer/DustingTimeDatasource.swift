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

