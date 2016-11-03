//
//  TextExampleViewController.swift
//  ImoCollectionView_Example
//
//  Created by Borinschi Ivan on 11/2/16.
//  Copyright © 2016 Imodeveloperlab. All rights reserved.
//

import UIKit
import ImoCollectionView


class TextExampleViewController: UIViewController {

    @IBOutlet weak var collectionView: ImoCollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        populateTable()
    }
    
    func populateTable() {
        
        collectionView.deleteAllSections()
        collectionView.addSection(section: section())
        collectionView.reloadData()
    }
    
    func section() -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        section.minimumLineSpacing = 1
        section.minimumLineSpacing = 1
        
        for text in texts
        {
            let source = TextCellSource(text: text)
            section.addSource(source: source);
        }
        
        return section;
    }
    
    func rotated()
    {
        populateTable()
        
    }

}
