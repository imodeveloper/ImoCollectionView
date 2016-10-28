//
//  ViewController.swift
//  ImoCollectionView_Example
//
//  Created by Borinschi Ivan on 10/28/16.
//  Copyright © 2016 Imodeveloperlab. All rights reserved.
//

import UIKit
import ImoCollectionView

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: ImoCollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.addSection(section: firstSection())
        collectionView.addSection(section: secondSection())
        collectionView.didSelectItemAt = { indexPath in
            
            print(indexPath)
            
        }
    }
    
    
    func header(title:String) -> HeaderViewSource {
        
        let header = HeaderViewSource(headerWithHeight: 50)
        header.title = "Title for first header"
        return header
    }
    
    
    func firstSection() -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.headerViewSource = header(title: "Title for first header");
        
        for _ in 1...20
        {
            let source = ImoCollectionViewCellSource()
            source.width = 80;
            source.height = 100;
            section.addSource(source: source);
        }
        
        return section;
    }
    
    func secondSection() -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.inset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        section.headerViewSource = header(title: "Title for second header");
        
        for _ in 1...20
        {
            let source = DemoCellSource()
            let screenSize: CGRect = UIScreen.main.bounds
            source.width = screenSize.width
            section.addSource(source: source);
        }
        
        return section;
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        collectionView.reloadData()
    }
    
}

