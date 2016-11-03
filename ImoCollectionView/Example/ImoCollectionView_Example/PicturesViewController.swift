//
//  PicturesViewController.swift
//  ImoCollectionView_Example
//
//  Created by Borinschi Ivan on 11/3/16.
//  Copyright © 2016 Imodeveloperlab. All rights reserved.
//

import UIKit
import ImoCollectionView

class PicturesViewController: UIViewController {

    @IBOutlet weak var collectionView: ImoCollectionView!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        populateTable()
    }
    
    func populateTable() {
        
        collectionView.deleteAllSections()
        collectionView.addSection(section: section(pictures:imagesCats, headerTitle:"Cats"))
        collectionView.addSection(section: section(pictures:imagesNature, headerTitle:"Nature"))
        collectionView.reloadData()
    }
    
    func section(pictures:Array<String>,headerTitle:String) -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.headerViewSource = header(title:headerTitle);
        section.inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        section.minimumLineSpacing = 15
        section.minimumLineSpacing = 25
        
        for pictureName in pictures
        {
            let source = PictureCellSource(picture: pictureName)
            section.addSource(source: source);
        }

        return section;
    }
    
    func header(title:String) -> HeaderViewSource {
        
        let header = HeaderViewSource(headerWithHeight: 50)
        header.title = title
        return header
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
