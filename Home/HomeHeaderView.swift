//
//  HomeHeaderView.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit

class HomeHeaderView: UIView {
    let welcomeLabel = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        makeInboxButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HomeHeaderView {
    func style() {
        backgroundColor = .backgroundWhite
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.text = "Good Afternoon John 🌤"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.setTitleColor(.label, for: .normal)
        
    }
    
    func layout() {
        addSubview(welcomeLabel)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            welcomeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: welcomeLabel.trailingAnchor, multiplier: 1),
            
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: welcomeLabel.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
            
            
        ])
        
    }
    
}
extension HomeHeaderView {
    func makeInboxButton() {
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope",withConfiguration: configuration)
        inboxButton.setImage(image, for: .normal)
        inboxButton.imageView?.tintColor = .secondaryLabel
        inboxButton.imageView?.contentMode = .scaleAspectFit
        
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.setTitleColor(.secondaryLabel, for: .normal)
        
        inboxButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        inboxButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
