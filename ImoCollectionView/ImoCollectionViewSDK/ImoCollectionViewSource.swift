//
//  ImoCollectionViewSource.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

public class ImoCollectionViewSource : NSObject {

    var cellClass : String
    public var height : CGFloat
    public var width : CGFloat
    
    public override init() {
        
        self.cellClass = "ImoCollectionViewSDK.ImoCollectionViewCell"
        self.height = 100
        self.width = 100
        
        super.init()
        
    }
    
}
