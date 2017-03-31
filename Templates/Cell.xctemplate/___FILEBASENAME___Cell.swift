//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import ImoCollectionView

class ___FILEBASENAME___CellSource: ImoCollectionViewCellSource {
    
    public init() {
        super.init(cellClass: "___FILEBASENAME___Cell")
        self.height = 100
        self.width = 100
        self.nib = UINib(nibName: self.cellClass, bundle: Bundle.init(for: self.classForCoder))
    }
}


class ___FILEBASENAME___Cell: ImoCollectionViewCell {
    
    public override func setUpWithSource(source: AnyObject) {
        if source is ___FILEBASENAME___CellSource {
            print(source)
        }
    }    
}
