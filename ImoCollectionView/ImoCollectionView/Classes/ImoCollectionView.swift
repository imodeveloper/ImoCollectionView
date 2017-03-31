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

public class ImoCollectionView: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    // MARK: - Proprietes
    
    var registeredCells = Array<String>()
    var registeredViews = Array<String>()
    var sections = Array<ImoCollectionViewSection>()
    public var collectionView: UICollectionView
    
    public var didSelectSource:((ImoCollectionViewCellSource?) -> (Void))?
    public var didSelectItemAt:((IndexPath) -> (Void))?
    public var scrollViewDidScroll:((UIScrollView) -> (Void))?
    public var scrollViewDidZoom:((UIScrollView) -> (Void))?
    public var scrollViewWillBeginDragging:((UIScrollView) -> (Void))?
    public var scrollViewWillEndDragging:((_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> (Void))?
    public var scrollViewDidEndDragging:((_ scrollView: UIScrollView, _ decelerate: Bool) -> (Void))?
    public var scrollViewWillBeginDecelerating:((UIScrollView) -> (Void))?
    
    // MARK: - UICollectionView
    
    public init(on view: UIView,
                collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout(),
                insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        
        self.collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        super.init(frame: view.frame)
        view.addSubview(self)
        view.edgesConstraints(to: self, insets: insets)
        self.setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    func setUp() {
        
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.addSubview(self.collectionView)
        self.edgesConstraints(to: self.collectionView)
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let closure = self.didSelectItemAt {
            closure(indexPath)
        }
        
        if let closure = self.didSelectSource {
            closure(self.cellSourceForIndexPath(indexPath: indexPath))
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
        
        if let source = self.cellSourceForIndexPath(indexPath: indexPath) {
           
            self.registerCellClassForSource(source: source)
            
            if let cell : ImoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: source.cellClass, for: indexPath) as? ImoCollectionViewCell {
                cell.setUpWithSource(source: source)
                return cell as UICollectionViewCell
            }
        }
        
        return UICollectionViewCell()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let headerViewSource = self.reusableViewSourceForIndexPath(indexPath: indexPath, kind: kind)
        {
           self.registerClassForReusableView(reusableViewSource: headerViewSource)
            
            let view : ImoCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: headerViewSource.kind, withReuseIdentifier: headerViewSource.indentifier, for: indexPath) as! ImoCollectionReusableView
            
            view.setUpWithSource(source: headerViewSource)
            
            return view;
        }
        else
        {
            return UICollectionReusableView()
        }
        
    }
    
    
    // MARK: - Helpers
    
    
    public func registeredViewsCount() -> Int {
        
        return registeredViews.count;
    }
    
    public func registeredCellsCount() -> Int {
        
        return registeredCells.count;
    }
    
    
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
    
    
    public func registerCellClassForSource(source:ImoCollectionViewCellSource) {
        
        if !registeredCells.contains(source.cellClass) {
            if let _ = source.nib {
                self.collectionView.register(source.nib, forCellWithReuseIdentifier: source.cellClass)
                registeredCells.append(source.cellClass)
            }
            else {
                self.collectionView.register(NSClassFromString(source.cellClass), forCellWithReuseIdentifier:source.cellClass)
                registeredCells.append(source.cellClass)
            }
        }
    }
    
    
    public func registerClassForReusableView(reusableViewSource:ImoCollectionReusableViewSource) {
        
        let identifier = reusableViewSource.viewClass.appending(reusableViewSource.indentifier)
        
        if !registeredViews.contains(identifier)  {
            if let _ = reusableViewSource.nib {
                self.collectionView.register(reusableViewSource.nib, forSupplementaryViewOfKind:  reusableViewSource.kind, withReuseIdentifier: reusableViewSource.indentifier)
                registeredViews.append(identifier)
                
            } else {
                self.collectionView.register(NSClassFromString(reusableViewSource.viewClass), forSupplementaryViewOfKind: reusableViewSource.kind, withReuseIdentifier:reusableViewSource.indentifier)
                registeredViews.append(identifier)
            }
        }
    }
    
    
    public func cellSourceForIndexPath(indexPath:IndexPath) -> ImoCollectionViewCellSource? {
        
        if self.sections.indices.contains(indexPath.section) {
            let section : ImoCollectionViewSection = self.sections[indexPath.section]
            return section.sourceAtIndex(index: indexPath.row)
        }
        
        return nil
    }
    
    public func reusableViewSourceForIndexPath(indexPath:IndexPath,kind: String) -> ImoCollectionReusableViewSource? {
        
        if self.sections.indices.contains(indexPath.section) {

            let section : ImoCollectionViewSection = self.sections[indexPath.section]
            
            if (kind == UICollectionElementKindSectionHeader) {
                return section.headerViewSource
            }
            else if (kind == UICollectionElementKindSectionFooter) {
                return section.footerViewSource
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
    
    public func deleteAllSections() {
        self.sections.removeAll()
    }
    
    public func update() {
        self.collectionView.reloadData()
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let source = self.cellSourceForIndexPath(indexPath: indexPath) {
            
            if (source.width != nil && source.height != nil) {
                
                return CGSize(width: source.width!, height: source.height!)
                
            }
            
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
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if let section = self.sectionForIndex(section: section) {
            return section.inset
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if let section = self.sectionForIndex(section: section) {
            
            if let header = section.headerViewSource {
                
                if let size = header.size {
                    return size;
                }
            }
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if let section = self.sectionForIndex(section: section) {
            
            if let footer = section.footerViewSource {
                
                if let size = footer.size {
                    return size;
                }
            }
        }
        
        return CGSize(width: 0, height: 0)
        
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
