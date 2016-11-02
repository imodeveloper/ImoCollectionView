//
//  ImoCollectionViewSection.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/19/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

open class ImoCollectionViewSection: NSObject {
    
    private var sources = Array<ImoCollectionViewCellSource>()
    
    open var minimumLineSpacing : CGFloat = 0.0
    open var minimumInteritemSpacing : CGFloat = 0.0
    open var inset: UIEdgeInsets
    
    open var headerViewSource: ImoCollectionReusableViewSource?
    open var footerView: ImoCollectionReusableViewSource?
    
    public override init() {
        
        minimumInteritemSpacing = 15
        minimumLineSpacing = 15
        inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
    }
    
    public func addSource(source:ImoCollectionViewCellSource) {
        
        sources.append(source);
    }
    
    public func removeSource(source:ImoCollectionViewCellSource) {
        
        if let index = self.indexOfSource(source: source) {
            sources.remove(at:index)
        }
    }
    
    public func countSources() -> Int {
        return sources.count;
    }
    
    public func containIndex(index:Int) -> Bool {
        
        if sources.indices.contains(index) {
            return true
        }
        return false;
    }
    
    public func sourceAtIndex(index:Int) -> ImoCollectionViewCellSource?  {
        
        if self.containIndex(index: index) {
            return sources[index]
        }
        
        return nil
    }
    
    public func indexOfSource(source:ImoCollectionViewCellSource) -> Int? {
        
        return sources.index(of: source)
    }
    
}

