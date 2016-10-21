//
//  ViewController.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/13/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit
import ImoCollectionViewSDK

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // MARK: - Section
        
        let section = ImoCollectionViewSection()
        section.minimumInteritemSpacing = 10
        section.minimumLineSpacing = 10

        for _ in 1...20
        {
            let source = ImoCollectionViewSource()
            section.addSource(source: source);
        }
        
        // MARK: - Section 2
        
        let section1 = ImoCollectionViewSection()
        section1.minimumInteritemSpacing = 10
        section1.minimumLineSpacing = 10
        
        for _ in 1...20
        {
            let source = TextCellSource()
            source.width = 110
            section1.addSource(source: source);
        }
        
        // MARK: - CollectionView
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = ImoCollectionView(controller: self, collectionViewLayout: layout)

        collectionView.addSection(section: section);
        collectionView.addSection(section: section1);
        
        self.view.addSubview(collectionView)
        
        collectionView.didSelectItemAt = { indexPath in
            
            print(indexPath)
            
        }
        
        collectionView.didSelectSource = { source in
        
            print(source)
            
        }
        
        
        collectionView.scrollViewDidScroll = { scrollView in
            
            print("scroll")
            
        }
        
        
        
    }
}

