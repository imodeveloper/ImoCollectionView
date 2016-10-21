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
    
    public var didSelectSource:((ImoCollectionViewSource?) -> (Void))?
    public var didSelectItemAt:((IndexPath) -> (Void))?
    public var scrollViewDidScroll:((UIScrollView) -> (Void))?
    public var scrollViewDidZoom:((UIScrollView) -> (Void))?
    public var scrollViewWillBeginDragging:((UIScrollView) -> (Void))?
    public var scrollViewWillEndDragging:((_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> (Void))?
    public var scrollViewDidEndDragging:((_ scrollView: UIScrollView, _ decelerate: Bool) -> (Void))?
    public var scrollViewWillBeginDecelerating:((UIScrollView) -> (Void))?
    
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
    
    
    // MARK: - UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let closure = self.didSelectItemAt {
            closure(indexPath)
        }
        
        if let closure = self.didSelectSource {
            closure(self.sourceForIndexPath(indexPath: indexPath))
        }
        
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
            return section.countSources()
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
            return section.sourceAtIndex(index: indexPath.row)
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
    
    
    // MARK: - UIScrollViewDelegate
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        if let closure = self.scrollViewDidScroll {
            closure(scrollView)
        }
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView)  {
        
        if let closure = self.scrollViewDidZoom {
            closure(scrollView)
        }
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        if let closure = self.scrollViewWillBeginDragging {
            closure(scrollView)
        }
    }
    
   
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if let closure = self.scrollViewWillEndDragging {
            closure(scrollView, velocity, targetContentOffset)
        }
    }
    

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if let closure = self.scrollViewDidEndDragging {
            closure(scrollView, decelerate)
        }
        
    }
    
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        if let closure = self.scrollViewWillBeginDecelerating {
            closure(scrollView)
        }
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        
    }
    
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        
        return true
        
    }
    
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
        
    }
    
    
}
