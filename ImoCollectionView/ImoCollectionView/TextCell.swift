//
//  TextCell.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/19/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit
import ImoCollectionViewSDK

class TextCellSource: ImoCollectionViewSource {

    public override init() {
        
        super.init()
        
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        
        self.cellClass = "\(appName).TextCell"
        self.height = 100
        self.width = 100
        
    }
    
}

class TextCell: ImoCollectionViewCell {
    
    public override func setUpWithSource(source:ImoCollectionViewSource) {
        self.backgroundColor = UIColor.blue;
    }
    
}
