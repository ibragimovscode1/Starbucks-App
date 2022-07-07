//
//  HomeVC.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit

class HomeVC: StarBucksVC {
    let headerView = HomeHeaderView()
    var tableView = UITableView()
    var headerViewTopConstraint: NSLayoutConstraint?
    let cellID = "cellId"
    let tiles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome Back",
        "Uplifting"
        
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
        setupTableView()
        
        
        
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good Afternoon John 🌤"
    }
    


}
extension HomeVC {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        
        
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(tableView)
       headerViewTopConstraint =  headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        
        ])
        
    }
    
}
//MARK: - TableView
extension HomeVC: UITableViewDataSource {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = tiles[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
    
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
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

