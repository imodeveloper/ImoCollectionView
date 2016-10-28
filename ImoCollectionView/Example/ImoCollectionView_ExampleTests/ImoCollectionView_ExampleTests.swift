//
//  ImoCollectionView_ExampleTests.swift
//  ImoCollectionView_ExampleTests
//
//  Created by Borinschi Ivan on 10/28/16.
//  Copyright © 2016 Imodeveloperlab. All rights reserved.
//

import Quick
import Nimble
import XCTest
import ImoCollectionView

class ImoCollectionView_ExampleTests: QuickSpec {
    
    override func spec()
    {
        let headerView1 = ImoCollectionReusableViewSource(footerWithHeight: 100)
        let headerView2 = ImoCollectionReusableViewSource(footerWithHeight: 100)
        
        let source1 = ImoCollectionViewCellSource()
        let source2 = ImoCollectionViewCellSource()
        let source3 = ImoCollectionViewCellSource()
        let source4 = ImoCollectionViewCellSource()
        let source5 = ImoCollectionViewCellSource()
        
        let section = ImoCollectionViewSection()
        section.addSource(source: source1)
        section.addSource(source: source2)
        
        section.headerViewSource = headerView1
        
        let section2 = ImoCollectionViewSection()
        section2.addSource(source: source3)
        section2.addSource(source: source4)
        
        let layout = UICollectionViewLayout()
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
        let collectionView = ImoCollectionView(frame: rect, collectionViewLayout: layout)
        
        collectionView.addSection(section: section)
        collectionView.addSection(section: section2)
        
        context("CollectionView")
        {
            
            it("Register class for reusable view source")
            {
                collectionView.registerClassForReusableView(reusableViewSource: headerView1)
                collectionView.registerClassForReusableView(reusableViewSource: headerView2)
                expect(collectionView.registeredViewsCount()).to(equal(1))
            }
            
            
            it("To find source")
            {
                let source = collectionView.cellSourceForIndexPath(indexPath: IndexPath(row: 0, section: 0))
                expect(source).toNot(beNil(), description: "To not be nil")
            }
            
            it("To find source")
            {
                let source = collectionView.cellSourceForIndexPath(indexPath: IndexPath(row: 1, section: 1))
                expect(source).toNot(beNil(), description: "To not be nil")
            }
            
            it("To not find source")
            {
                let source = collectionView.cellSourceForIndexPath(indexPath: IndexPath(row: 0, section: 5))
                expect(source).to(beNil(), description: "To be nil")
            }
            
            it("Register class for cell source")
            {
                collectionView.registerCellClassForSource(source: source1)
                collectionView.registerCellClassForSource(source: source1)
                collectionView.registerCellClassForSource(source: source1)
                expect(collectionView.registeredCellsCount()).to(equal(1))
            }
            
            
            it("To find source for view")
            {
                let source = collectionView.reusableViewSourceForIndexPath(indexPath: IndexPath(row: 100, section:0))
                expect(source).toNot(beNil(), description: "To not be nil")
            }
            
            
            it("To find source for view")
            {
                let source = collectionView.reusableViewSourceForIndexPath(indexPath: IndexPath(row: 100, section:1))
                expect(source).to(beNil(), description: "To be nil")
            }
            
            
            it("Total sections")
            {
                let count = collectionView.sectionsCount()
                expect(count).to(equal(2))
            }
            
            it("Total sources in section")
            {
                let count = collectionView.sourcesCount(inSection: 0)
                expect(count).to(equal(2))
            }
            
            it("Total sources in section")
            {
                let count = collectionView.sourcesCount(inSection: 1)
                expect(count).to(equal(2))
            }
            
            it("Total sources in section")
            {
                let count = collectionView.sourcesCount(inSection: 2)
                expect(count).to(equal(0))
            }
            
        }
        
        context("CollectionViewSection")
        {
            it ("Count sources")
            {
                expect(section.countSources()).to(equal(2))
            }
            
            it ("Contain index true")
            {
                expect(section.containIndex(index: 1)).to(equal(true))
            }
            
            it ("Contain index false")
            {
                expect(section.containIndex(index: 10)).to(equal(false))
            }
            
            it ("Source at index")
            {
                let source = section.sourceAtIndex(index: 0)
                expect(source).to(equal(source1))
            }
            
            it ("Source at index nill")
            {
                let source = section.sourceAtIndex(index: 10)
                expect(source).to(beNil())
            }
            
            it ("Add source")
            {
                section.addSource(source: source5)
                expect(section.countSources()).to(equal(3))
            }
            
            it ("Remove source")
            {
                section.removeSource(source: source5)
                expect(section.countSources()).to(equal(2))
            }
            
            it ("Index of source")
            {
                let index = section.indexOfSource(source: source2)
                expect(index).to(equal(1))
            }
            
        }
        
        
        context("CollectionReusableView") {
            
            
            
        }
        
    }
    
}
