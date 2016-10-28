//
//  ImoCollectionViewCell.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/18/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionViewCell : UICollectionViewCell {
    
    open func setUpWithSource(source:ImoCollectionViewCellSource) {
        self.backgroundColor = UIColor.green;        
    }
    
    open override func prepareForReuse() {
        
        
        
    }
    
}

