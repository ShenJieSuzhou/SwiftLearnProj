//
//  JJFacebookMeViewController.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/8/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit

class JJFacebookMeViewController: UIViewController {

    typealias RowModel = [String: String]
    
    fileprivate var user: FBMeUser{
        get{
            return FBMeUser(name: "Steve Jobs", education: "CMU")
        }
    }
    
    fileprivate var tableViewDataSource: [[String: Any]] {
        get{
            return TableKeys.populate(withUser: user)
        }
    }
    
    private let fbTableView: UITableView = {
        let view = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        view.register(FBMeBaseCell.self, forCellReuseIdentifier: FBMeBaseCell.identifier)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Specs.color.white
        title = "FacebookMe"
        navigationController?.navigationBar.barTintColor = Specs.color.tint

        fbTableView.delegate = self
        fbTableView.dataSource = self
        view.addSubview(fbTableView)
    }
    
    fileprivate func rows(at section: Int) -> [Any]{
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
    
    fileprivate func title(at section: Int) -> String?{
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
    
    fileprivate func rowModel(at indexPath: IndexPath) -> RowModel{
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
}

extension JJFacebookMeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        
        if title == user.name {
            return 64.0
        }else{
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return
        }
        
        if title == TableKeys.seeMore || title == TableKeys.addFavorites{
            cell.textLabel?.textColor = Specs.color.tint
            cell.accessoryType = .none
        }else if title == TableKeys.logout{
            if #available(iOS 9.0, *) {
                cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            cell.textLabel?.textColor = Specs.color.red
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .disclosureIndicator
        }
    }
}

extension JJFacebookMeViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = rowModel(at: indexPath)
        var cell = UITableViewCell()
        
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        
        if title == user.name {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeBaseCell.identifier, for: indexPath)
        }
        
        cell.textLabel?.text = title
        if let imageName = modelForRow[TableKeys.ImageName]{
            cell.imageView?.image = UIImage(named: imageName)
        }else if title != TableKeys.logout {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        if title == user.name {
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        
        return cell
    }
}
