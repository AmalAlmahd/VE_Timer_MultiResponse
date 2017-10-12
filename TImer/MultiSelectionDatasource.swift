//
//  MultiSelectionDatasource.swift
//  TImer
//
//  Created by RoviSys on 10/12/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import LBTAComponents

//struct DustingTimeModel {
//    var location: String?
//}

class MultiSelectionDatasource: Datasource {
    
    let responses: [String]?
  

    override init() {
        self.responses = [String]()
        self.responses?.append("Don't Do Anything")
        self.responses?.append("Act Like Nothing Happened")
    }
    

    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [MultiSelectionCell.self]
    }
    
    // This method runs the datasource items laid out in the cells
    override func item(_ indexPath: IndexPath) -> Any? {
        if let responses = self.responses {
            return responses[indexPath.item]
        }
        return "No Responses"
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if let responses = self.responses {
            return responses.count
        }
        return 1
    }
}

