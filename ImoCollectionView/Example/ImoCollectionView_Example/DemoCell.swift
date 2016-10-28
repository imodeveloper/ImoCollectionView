//
//  DemoCell.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/27/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit
import ImoCollectionView

class DemoCellSource: ImoCollectionViewCellSource {

    public override init() {
        
        super.init()
        
        self.cellClass = "DemoCell"
        self.height = 100
        self.width = 100
        self.nib = UINib(nibName: self.cellClass, bundle: Bundle.init(for: self.classForCoder))
    }
    
}


class DemoCell: ImoCollectionViewCell {
    
    public override func setUpWithSource(source:ImoCollectionViewCellSource) {
        
        
        
    }
    
}
