//
//  SearchShopViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/27.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class SearchShopViewController: UIViewController {
    
    var data: [String] = ["咖啡", "鸡排", "冷饮", "奶茶", "水果店"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchShopViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchSpeciesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchSpeciesCell", for: indexPath) as! SearchSpeciesCell
        cell.refreshUI(text: data[indexPath.row])
        return cell
    }
    
    
}
