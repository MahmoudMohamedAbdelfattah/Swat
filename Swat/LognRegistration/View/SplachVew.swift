//
//  SplachVew.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/24/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
extension FristRegistration {
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
    self.CollectionSplach.dataSource = self
    self.CollectionSplach.delegate = self
    CollectionSplach.register(UINib(nibName: "RegCollection", bundle: nil), forCellWithReuseIdentifier: "cellSplach")
                  
    }
    let SplachIMGArray = ["secuirty","Operation","All"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SplachIMGArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = CollectionSplach.dequeueReusableCell(withReuseIdentifier: "cellSplach", for: indexPath) as! SplachCell
    
        return cell
        
    }
    
}
