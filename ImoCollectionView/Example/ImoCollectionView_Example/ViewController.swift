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
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        /*
        collectionView.didSelectItemAt = { indexPath in
            
            print(indexPath)
            
        }
 */
    }
    
    
    func populateTable() {
        
        //collectionView.deleteAllSections()
        //collectionView.addSection(section: firstSection())
        //collectionView.addSection(section: secondSection())
        //collectionView.reloadData()
    }
    
    
    func header(title:String) -> TitleHeaderViewSource {
        
        let header = TitleHeaderViewSource(headerWithHeight: 50)
        header.title = "Title for first header"
        return header
    }
    
    
    func firstSection() -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.inset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        section.headerViewSource = header(title: "Title for first header");
        
        for _ in 1...20
        {
            let source = PictureCellSource(picture:"cat")
            section.addSource(source: source);
        }
        
        return section;
    }
    
    func secondSection() -> ImoCollectionViewSection {
        
        let section = ImoCollectionViewSection()
        section.inset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        section.minimumLineSpacing = 1
        section.minimumLineSpacing = 1
        section.headerViewSource = header(title: "Title for second header");
        
        for _ in 1...10
        {
            let source = TextCellSource(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ")
            section.addSource(source: source);
            
            let source2 = TextCellSource(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
            section.addSource(source: source2);
            
            let source3 = TextCellSource(text: "Contrary to popular belief")
            section.addSource(source: source3);

            let source4 = TextCellSource(text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.")
            section.addSource(source: source4);
            
            
            let source5 = TextCellSource(text: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.")
            section.addSource(source: source5);
                        
        }
        
        return section;
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        

    }
    
    func rotated()
    {
        populateTable()
        
    }
    
}

