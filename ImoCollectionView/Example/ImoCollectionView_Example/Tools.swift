//
//  Tools.swift
//  ImoCollectionView_Example
//
//  Created by Borinschi Ivan on 11/4/16.
//  Copyright © 2016 Imodeveloperlab. All rights reserved.
//

import UIKit

extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return (string as NSString).boundingRect(with: CGSize(width: width, height: DBL_MAX),
                                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                 attributes: [NSFontAttributeName: self],
                                                 context: nil).size
    }
}
