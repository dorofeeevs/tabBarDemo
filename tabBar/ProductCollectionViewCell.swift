//
//  ProductCollectionViewCell.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 03.06.2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    // MARK:- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    //MARK:- Properties
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.baselineAdjustment = .none
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var productCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productRaitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 8)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var product: Product? {
        didSet {
            productTitleLabel.text = product?.productTitle
            productCostLabel.text = product?.productCost
            productRaitingLabel.text = product?.productRaiting
            if let image = product?.productImageName {
                productImageView.image = UIImage(named: image)
            }
        }
    }
}

extension ProductCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(productTitleLabel)
        roundedBackgroundView.addSubview(productImageView)
        roundedBackgroundView.addSubview(productCostLabel)
        roundedBackgroundView.addSubview(productRaitingLabel)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor, constant: 5),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor, constant: -5),
            
            
            productTitleLabel.topAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            productTitleLabel.bottomAnchor.constraint(equalTo: productCostLabel.topAnchor),
            productTitleLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 5),
            productTitleLabel.rightAnchor.constraint(equalTo:                 roundedBackgroundView.rightAnchor, constant: -5),
            
            
            productCostLabel.bottomAnchor.constraint(equalTo: roundedBackgroundView.bottomAnchor),
            productCostLabel.topAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor, constant: 50),
            productCostLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor),
            productCostLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor),
            
            
            productRaitingLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor),
            productRaitingLabel.bottomAnchor.constraint(equalTo: productTitleLabel.topAnchor, constant: -50),
            productRaitingLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor),
            productRaitingLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 130),
            
            
            productImageView.topAnchor.constraint(equalTo: productRaitingLabel.topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: productTitleLabel.topAnchor),
            productImageView.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor),
            productImageView.rightAnchor.constraint(equalTo: productRaitingLabel.rightAnchor )
        ])
    }
}
