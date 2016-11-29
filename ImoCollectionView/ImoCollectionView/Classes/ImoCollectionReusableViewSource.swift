//
//  ImoCollectionReusableViewSource.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/24/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionReusableViewSource : NSObject {
    
    open var viewClass = "ImoCollectionView.ImoCollectionReusableView"
    open var indentifier = "ImoCollectionReusableView"
    
    open var kind : String = UICollectionElementKindSectionHeader
    open var size : CGSize?
    open var nib : UINib?
    
    public init(headerWithHeight height:CGFloat) {
        
        super.init()
        
        self.kind = UICollectionElementKindSectionHeader
        setUp(height: height)
    }
    
    public init(footerWithHeight height:CGFloat) {
        
        super.init()
        self.kind = UICollectionElementKindSectionFooter
        setUp(height: height)
    }
    
    
    public func setHeight(height:CGFloat) {
        
        self.size = CGSize(width: 1, height: height);
        
    }
    
    
    func setUp(height:CGFloat) {
        
        self.size = CGSize(width: 1, height: height);
        self.indentifier = "ImoCollectionReusableView"
        self.nib = nil;
    }    
}
