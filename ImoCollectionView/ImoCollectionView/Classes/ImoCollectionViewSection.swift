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

    /// Minimum line space
    open var minimumLineSpacing : CGFloat = 0.0
    
    /// Minimum inter item spacing
    open var minimumInteritemSpacing : CGFloat = 0.0
    
    /// Section inssets
    open var inset: UIEdgeInsets
    
    /// Header view source
    open var headerViewSource: ImoCollectionReusableViewSource?
    
    /// Footer view source
    open var footerViewSource: ImoCollectionReusableViewSource?
    
    public override init() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    /// Add array of sources in section
    ///
    /// - Parameter sources: Sources array
    public func addSources(_ sources:[ImoCollectionViewCellSource]) {
        for source in sources {
            self.sources.append(source);
        }
    }
    
    /// Add one source in section
    ///
    /// - Parameter source: Source
    public func addSource(_ source:ImoCollectionViewCellSource) {
        self.sources.append(source);
    }
    
    /// Remove soure from section
    ///
    /// - Parameter source: source object to remove
    public func removeSource(source:ImoCollectionViewCellSource) {
        if let index = self.indexOfSource(source: source) {
            sources.remove(at:index)
        }
    }
    
    /// Remove all sources from section
    public func removeAllSources() {
        sources.removeAll()
    }
    
    /// Count number of sources in section
    ///
    /// - Returns: Number of sources in section
    public func countSources() -> Int {
        return sources.count;
    }
    
    /// Check if section contain index
    ///
    /// - Parameter index: Index Number
    /// - Returns: true / false
    public func containIndex(index:Int) -> Bool {
        if sources.indices.contains(index) {
            return true
        }
        return false;
    }
    
    /// Get source at index
    ///
    /// - Parameter index: Source Index
    /// - Returns: ImoCollectionViewCellSource
    public func sourceAtIndex(index:Int) -> ImoCollectionViewCellSource?  {
        if self.containIndex(index: index) {
            return sources[index]
        }
        return nil
    }
    
    /// Get all sources
    ///
    /// - Returns: Array of sources
    public func allSources() -> [ImoCollectionViewCellSource] {
        return sources
    }
    
    /// Index of source
    ///
    /// - Parameter source: Source to check index for
    /// - Returns: Index number for source
    public func indexOfSource(source:ImoCollectionViewCellSource) -> Int? {
        return sources.index(of: source)
    }
}

