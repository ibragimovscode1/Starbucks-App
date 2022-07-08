//
//  TileVC.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit
class TileVC: UIViewController{
    let tileView = TileView()
    init(title: String, subtitle: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        tileView.label.text = title
        tileView.subTitleLabel.text = subtitle
        tileView.imageView.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style() {
        tileView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    func layout() {
        view.addSubview(tileView)
        
        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
}
