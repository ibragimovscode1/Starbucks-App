//
//  TileView.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit
class TileView: UIView {
    var imageView = UIImageView()
    var label = UILabel()
    var subTitleLabel = UILabel()
    let ctaButton = makeGreenButton(withText: "Order")
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TileView {
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "meatless")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breakfast made meatless"
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        subTitleLabel.lineBreakMode = .byWordWrapping
        subTitleLabel.text = "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetraian and protein-packed."
        
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
     
    func layout() {
        addSubview(imageView)
        addSubview(label)
        addSubview(subTitleLabel)
        addSubview(ctaButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 2),
            subTitleLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            
            
            ctaButton.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 2),
            ctaButton.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            ctaButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
            
            
        
        ])
        
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
}
