//
//  ImoCollectionViewCellSource.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionViewCellSource : NSObject {

    open var cellClass : String
    open var height : CGFloat?
    open var width : CGFloat?
    open var nib : UINib?
    open var accessibilityIdentifier: String?
    
    public init(cellClass:String) {        
        self.cellClass = cellClass
        super.init()
    }
   
}
