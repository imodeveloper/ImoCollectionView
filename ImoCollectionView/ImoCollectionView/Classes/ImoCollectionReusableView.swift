//
//  ImoCollectionReusableView.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/21/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionReusableView: UICollectionReusableView {
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
    }
    
    open override func prepareForReuse() {
    
        super.prepareForReuse()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    open func setUpWithSource(source:AnyObject) {
        
        
    }
    
}



