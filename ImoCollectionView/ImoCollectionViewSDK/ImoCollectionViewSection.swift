//
//  ImoCollectionViewSection.swift
//  ImoCollectionView
//
//  Created by Borinschi Ivan on 10/19/16.
//  Copyright © 2016 Imodeveloper. All rights reserved.
//

import UIKit

public class ImoCollectionViewSection: NSObject {

    public var minimumLineSpacing : CGFloat = 0.0
    public var minimumInteritemSpacing : CGFloat = 0.0
    
    var sources = Array<ImoCollectionViewSource>()
    
    public func addSource(source:ImoCollectionViewSource) {
        sources.append(source);
    }
    
}
