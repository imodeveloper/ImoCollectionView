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
        
        let section = ImoCollectionViewSection()
        section.minimumInteritemSpacing = 10
        section.minimumLineSpacing = 10
        

        for _ in 1...20
        {
            let source = ImoCollectionViewSource()
            section.addSource(source: source);
        }
        
        
        let section1 = ImoCollectionViewSection()
        section1.minimumInteritemSpacing = 10
        section1.minimumLineSpacing = 10
        
        for _ in 1...20
        {
            let source = TextCellSource()
            source.width = 110
            section1.addSource(source: source);
        }
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = ImoCollectionView(controller: self, collectionViewLayout: layout)

        collectionView.addSection(section: section);
        collectionView.addSection(section: section1);
        
        self.view.addSubview(collectionView)
        collectionView.reloadData()
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            
            collectionView.reloadData()
        }
    }
}

