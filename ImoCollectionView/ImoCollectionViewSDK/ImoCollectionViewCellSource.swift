//
//  ImoCollectionViewSource.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionViewSource : NSObject {

    open var cellClass : String
    open var height : CGFloat
    open var width : CGFloat
    
    public override init() {
        
        self.cellClass = "ImoCollectionViewSDK.ImoCollectionViewCell"
        self.height = 50
        self.width = 50
        super.init()
        
    }
    
}
