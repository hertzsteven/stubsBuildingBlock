//
//  TestViewController.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/7/22.
//

import UIKit


final class CollectionViewController: UIViewController {
    
    var data = [UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green]
    

    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing:CollectionViewCell.self))
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        
    }

//    override func loadView() {
//        setUpFlowAndCollectionView()
//    }
    
    private func setupView() {
        setUpFlowAndCollectionView()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.pinToSidesOfsuperView(spacingFrom: 1)
    }
    
    private func setUpFlowAndCollectionView() {
        let layout = UICollectionViewFlowLayout()
        // size
        layout.itemSize = CGSize(width: 300, height: 200)
        // insets
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        // direction
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
//        self.view = collectionView
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:CollectionViewCell.self), for: indexPath)
                as? CollectionViewCell
        else {
            fatalError("could not dequeu it ")
        }
        let dataItem = data[indexPath.item]
        
        cell.doUpdate(color: dataItem)
//        cell.backgroundColor = dataItem
        
        return cell
    }
}

