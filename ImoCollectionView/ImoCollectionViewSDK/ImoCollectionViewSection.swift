//
//  ImoCollectionViewSection.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/19/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

public class ImoCollectionViewSection: NSObject {

    private var sources = Array<ImoCollectionViewSource>()
    
    public var minimumLineSpacing : CGFloat = 0.0
    public var minimumInteritemSpacing : CGFloat = 0.0
    
    public func addSource(source:ImoCollectionViewSource) {
        
        sources.append(source);
    }
    
    public func removeSource(source:ImoCollectionViewSource) {
        
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
    
    public func sourceAtIndex(index:Int) -> ImoCollectionViewSource?  {
        
        if self.containIndex(index: index) {
            return sources[index]
        }
        
        return nil
    }
    
    public func indexOfSource(source:ImoCollectionViewSource) -> Int? {
        
        return sources.index(of: source)
    }
    
}
