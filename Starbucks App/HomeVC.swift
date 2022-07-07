//
//  HomeVC.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit

class HomeVC: StarBucksVC {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        
        
        
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good Afternoon John 🌤"
    }


}

