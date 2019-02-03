//
//  ViewController.swift
//  UICollectionViewExample
//
//  Created by Ankit Kumar on 03/02/19.
//  Copyright © 2019 Ankit Kumar. All rights reserved.
//

import UIKit

//Step: 2
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    //Step: 3
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Step: 4
        return 6
    }
    
    let colors:[UIColor] = [UIColor.init(red: 142/255, green: 36/255, blue: 170/255, alpha: 1),
                            UIColor.init(red: 3/255, green: 169/255, blue: 244/255, alpha: 1),
                            UIColor.init(red: 255/255, green: 87/255, blue: 34/255, alpha: 1),
                            UIColor.init(red: 96/255, green: 125/255, blue: 139/255, alpha: 1),
                            UIColor.init(red: 84/255, green: 110/255, blue: 122/255, alpha: 1)]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Step: 6
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = colors[indexPath.row % colors.count]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height: CGFloat = 200
        return CGSize(width: width, height: height)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        addConstraintsToCollectionView()
        
        //Step: 1
        collectionView.dataSource = self
        collectionView.delegate = self
        //Step: 5
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    fileprivate func addConstraintsToCollectionView(){
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

