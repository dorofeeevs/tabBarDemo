//
//  ProductViewController.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 03.06.2021.
//

import UIKit

class ProductCollectionViewController: UIViewController {

    lazy var productCollectionView: UICollectionView = {
        let prodCollView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        prodCollView.backgroundColor = .white
        prodCollView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        prodCollView.contentInsetAdjustmentBehavior = .always

        prodCollView.dataSource = self
        prodCollView.delegate = self
        prodCollView.translatesAutoresizingMaskIntoConstraints = false
        return prodCollView
    }()
    
    var itemProductArray: [Product] = {
        var blankProduct = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
    
        var blankProduct2 = Product(productTitle: "Socs", productCost: "999 rub.", productRaiting: "3.6", productImageName: "socks")
        
        var blankProduct3 = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
        
        var blankProduct4 = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
        
        var blankProduct5 = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
        
        var blankProduct6 = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
        
        var blankProduct7 = Product(productTitle: "Sneakers", productCost: "7.999 rub.", productRaiting: "5.0", productImageName: "nike")
        
        return [blankProduct,blankProduct2, blankProduct3, blankProduct4, blankProduct5, blankProduct6, blankProduct7]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

extension ProductCollectionViewController {
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
             navigationController?.navigationBar.setNeedsLayout()
           overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(productCollectionView)
        
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            productCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            productCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width/2.2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        return layout
    }
}

extension ProductCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemProductArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell {
            cell.product = itemProductArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
}
