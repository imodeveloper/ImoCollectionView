//
//  ImoCollectionViewSDKTests.swift
//  ImoCollectionViewSDKTests
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import Quick
import Nimble
import ImoCollectionViewSDK

@testable import ImoCollectionViewSDK

class ImoCollectionViewSDKTests: QuickSpec {
    
    override func spec()
    {
        context("CollectionView") { 
        
            let source1 = ImoCollectionViewSource()
            let source2 = ImoCollectionViewSource()
            let source3 = ImoCollectionViewSource()
            let source4 = ImoCollectionViewSource()
            
            let section = ImoCollectionViewSection()
            section.addSource(source: source1)
            section.addSource(source: source2)
            
            let section2 = ImoCollectionViewSection()
            section2.addSource(source: source3)
            section2.addSource(source: source4)
            
            let layout = UICollectionViewLayout()
            
            let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
            let collectionView = ImoCollectionView(frame: rect, collectionViewLayout: layout)
            
            collectionView.addSection(section: section)
            collectionView.addSection(section: section2)
            
            it("To find source")
            {
                let source = collectionView.sourceForIndexPath(indexPath: IndexPath(row: 0, section: 0))
                expect(source).toNot(beNil(), description: "To not be nil")
            }
            
            it("To find source")
            {
                let source = collectionView.sourceForIndexPath(indexPath: IndexPath(row: 1, section: 1))
                expect(source).toNot(beNil(), description: "To not be nil")
            }
            
            it("To not find source")
            {
                let source = collectionView.sourceForIndexPath(indexPath: IndexPath(row: 0, section: 3))
                expect(source).to(beNil(), description: "To be nil")
            }
            
            it("Register class")
            {
                collectionView.registerClassForSource(source: source1)
                collectionView.registerClassForSource(source: source1)
                collectionView.registerClassForSource(source: source1)
                expect(collectionView.registeredCells.count).to(equal(1))
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
    }
}
