//
//  DemoCell.swift
//  ImoCollectionView_Example
//
//  Created by Borinschi Ivan on 3/31/17.
//  Copyright © 2017 Imodeveloperlab. All rights reserved.
//

import UIKit
import ImoCollectionView

class DemoCellSource: ImoCollectionViewCellSource {
    
    public init() {
        super.init(cellClass: "DemoCell")
        self.height = 200
        self.width = 200
        self.nib = UINib(nibName: self.cellClass, bundle: Bundle.init(for: self.classForCoder))
    }
}


class DemoCell: ImoCollectionViewCell {
    
    public override func setUpWithSource(source: AnyObject) {
        if source is DemoCellSource {
            print(source)
        }
    }    
}
