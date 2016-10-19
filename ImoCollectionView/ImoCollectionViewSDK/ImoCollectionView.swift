//
//  ImoCollectionView.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

protocol ImoCollectionViewProtocol {
    
}

public class ImoCollectionView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    // MARK: - Proprietes
    
    var registeredCells = Array<String>()
    var registeredViews = Array<String>()
    var sections = Array<ImoCollectionViewSection>()
    var imoDelegate : AnyObject?

    // MARK: - UICollectionView
    
    public init(controller: UIViewController, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: controller.view.frame, collectionViewLayout: layout)
        self.setUp()
    }
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        self.setUp()
    }
    
    func setUp() {
        
        self.backgroundColor = UIColor.red
        self.delegate = self;
        self.dataSource = self;
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.sourcesCount(inSection: section)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.sectionsCount()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let source = self.sourceForIndexPath(indexPath: indexPath)
        {
            self.registerClassForSource(source: source)
            let cell : ImoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: source.cellClass, for: indexPath) as! ImoCollectionViewCell
            cell.setUpWithSource(source: source)
            return cell as UICollectionViewCell
        }
        
        return UICollectionViewCell()
    }
    
    
    // MARK: - Helpers
    
    public func sectionsCount() -> Int {
        
        return sections.count
    }
    
    public func sourcesCount(inSection sectionIndex:Int) -> Int {
        
        if self.sections.indices.contains(sectionIndex) {
            
            let section : ImoCollectionViewSection = self.sections[sectionIndex]
            return section.sources.count;
        }
        
        return 0
    }
    
    public func registerClassForSource(source:ImoCollectionViewSource) {
        
        if !registeredCells.contains(source.cellClass)
        {
            self.register(NSClassFromString(source.cellClass), forCellWithReuseIdentifier:source.cellClass)
            registeredCells.append(source.cellClass)
        }
    }
    
    public func sourceForIndexPath(indexPath:IndexPath) -> ImoCollectionViewSource? {
        
        if self.sections.indices.contains(indexPath.section) {
            
            let section : ImoCollectionViewSection = self.sections[indexPath.section]
            
            if section.sources.indices.contains(indexPath.row) {
                
                return section.sources[indexPath.row];
            }
        }
        
        return nil
    }
    
    
    public func sectionForIndex(section:Int) -> ImoCollectionViewSection? {
        
        if self.sections.indices.contains(section) {
            let section : ImoCollectionViewSection = self.sections[section]
            return section;
        }

        return nil
    }
    
    
    public func addSection(section:ImoCollectionViewSection) {
        
        self.sections.append(section)
        
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let source = self.sourceForIndexPath(indexPath: indexPath) {
            return CGSize(width: source.width, height: source.height)
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if let section = self.sectionForIndex(section: section) {
            return section.minimumLineSpacing
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if let section = self.sectionForIndex(section: section) {
            return section.minimumInteritemSpacing
        }
        
        return 0
    }
    
    
    // FIXME: fix margins
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    
}
