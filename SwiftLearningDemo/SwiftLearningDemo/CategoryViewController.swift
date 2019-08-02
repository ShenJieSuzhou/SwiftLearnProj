//
//  CategoryViewController.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/8/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit

class CategoryViewController: JJBaseViewController {

    private var categories: [String] = ["Project 01 - GoodAsOldPhones",
                                        "Project 02 - Stopwatch",
                                        "Project 03 - FacebookMe",
                                        "Project 04 - Todo",
                                        "Project 05 - Artistry",
                                        "Project 06 - CandySearch",
                                        "Project 07 - PokedexGo",
                                        "Project 08 - SimpleRSSReader",
                                        "Project 09 - PhotoScroll",
                                        "Project 10 - Interests",
                                        "Project 11 - Animations",
                                        "Project 12 - Tumblr",
                                        "Project 13 - TwitterBird",
                                        "Project 14 - QuoraDots",
                                        "Project 15 - SnapchatMenu",
                                        "Project 16 - SpotifySignIn",
                                        "Project 17 - ClassicPhotos",
                                        "Project 18 - BlueLibrarySwift",
                                        "Project 19 - Pinterest",
                                        "Project 20 - FlickrSearch",
                                        "Project 21 - Browser",
                                        "Project 22 - HonoluluArt",
                                        "Project 23 - Birthdays",
                                        "Project 24 - HitList",
                                        "Project 25 - WeatherExtension",
                                        "Project 26 - Scale",
                                        "Project 27 - NotificationsUI",
                                        "Project 28 - SceneDetector",
                                        "Project 29 - Marslink",
                                        "Project 30 - PhotoTagger"]
    
    
    private let categoryTableView: UITableView = {
        let view = UITableView(frame: UIScreen.main.bounds, style: .plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        navigationController?.navigationBar.barTintColor = Specs.color.gunGary
        
        if let bar = navigationController?.navigationBar {
            var attrs = bar.titleTextAttributes
            if attrs == nil {
                attrs = [NSAttributedString.Key:Any]()
            }
            attrs?[NSAttributedString.Key.foregroundColor] = Specs.color.white
            bar.titleTextAttributes = attrs
        }
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        view.addSubview(categoryTableView)
    }
}

extension CategoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
}

extension CategoryViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = categories[indexPath.row]
        cell.textLabel?.textColor = Specs.color.white
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        switch cell?.textLabel?.text {
        case "Project 03 - FacebookMe":
            navigationController?.pushViewController(JJFacebookMeViewController(), animated: true)
            break
        default:
            break
        }
        
        
    }
}
