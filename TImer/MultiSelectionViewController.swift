//
//  MultiSelectionViewController.swift
//  TImer
//
//  Created by RoviSys on 10/12/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit
import LBTAComponents



class MultiSelectionViewController: DatasourceController {
    
    let window = UIApplication.shared.keyWindow
    let cellid = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.datasource = MultiSelectionDatasource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

