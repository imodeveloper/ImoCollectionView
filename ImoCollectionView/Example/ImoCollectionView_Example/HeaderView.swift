//
//  HeaderView.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/27/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit
import ImoCollectionView

class HeaderView: ImoCollectionReusableView  {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func setUpWithSource(source: AnyObject) {

        let x = source as! HeaderViewSource
        
        if let title = x.title {
            titleLabel.text = title
        }
        

    }
    
}

class HeaderViewSource: ImoCollectionReusableViewSource {
    
    var title : String?
    
    override init(headerWithHeight height: Int) {
        
        super.init(headerWithHeight: height)
        self.viewClass = "HeaderView"
        self.nib = UINib(nibName: self.viewClass, bundle: Bundle.init(for: self.classForCoder))
    }
}
