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

        for _ in 1...100
        {
            let source = ImoCollectionViewSource()
            source.width = 110
            section.addSource(source: source);
        }
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = ImoCollectionView(controller: self, collectionViewLayout: layout)

        collectionView.addSection(section: section);
        
        self.view.addSubview(collectionView)
        collectionView.reloadData()
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            
            collectionView.reloadData()
        }
    }
}

