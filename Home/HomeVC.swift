//
//  HomeVC.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit

class HomeVC: StarBucksVC {
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let scanButton = UIButton()
    
  
    var headerViewTopConstraint: NSLayoutConstraint?
    struct ScanButtonSpacing {
        static let  height: CGFloat = 60
        static let  width: CGFloat = 170
    }
    let cellID = "cellId"
    let tiles = [
        RewardsTileVC(),
        TileVC(title: "Breakfast made meatless", subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetraian and protein-packed.", imageName: "meatless"),
        TileVC(title: "Uplifting our communities", subtitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.", imageName: "communities"),
        TileVC(title: "Spend at least $15 for 50 Bonus stars", subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.", imageName: "bonus"),
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
        setupScrollView()
    
        
        
        
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good Afternoon John 🌤"
    }
    func setupScrollView() {
        scrollView.delegate = self
    }
    


}
extension HomeVC {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundWhite
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Order in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = 30
        
        
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        view.addSubview(scanButton)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
     
       headerViewTopConstraint =  headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height)
            ])
        
    }
}
    
    extension HomeVC: UIScrollViewDelegate{
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.welcomeLabel.frame.height + 16
        UIView.animate(withDuration: 0.3) {
            self.headerView.welcomeLabel.alpha = swipingDown ? 1.0 : 0.0
            }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations:{
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
       
    }
        


}

