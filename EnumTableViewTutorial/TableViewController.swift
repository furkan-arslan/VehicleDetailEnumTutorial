//
//  TableViewController.swift
//  EnumTableViewTutorial
//
//  Created by Furkan Arslan on 24/12/2017.
//  Copyright © 2017 Furkan Arslan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var sections: [TableSection] = [.Title, .Image, .Price, .Description, .Actions]
    var userActions: [UserAction] = [.ContactSeller, .Like, .Share]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView(){
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        sections.forEach { section in
            section.register(tableView: tableView)
        }
    }
}

// MARK: - UITableView Delegate & Datasource
extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfItems(userActions: userActions)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .Title:
            return tableView.dequeueReusableCell(withIdentifier: CarTitleCell.cellIdentifier(), for: indexPath) as! CarTitleCell
        case .Image:
            return tableView.dequeueReusableCell(withIdentifier: CarImageCell.cellIdentifier(), for: indexPath) as! CarImageCell
        case .Price:
            return tableView.dequeueReusableCell(withIdentifier: CarPriceCell.cellIdentifier(), for: indexPath) as! CarPriceCell
        case .Description:
            return tableView.dequeueReusableCell(withIdentifier: CarDescriptionCell.cellIdentifier(), for: indexPath) as! CarDescriptionCell
        case .Actions:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarActionsCell.cellIdentifier(), for: indexPath) as! CarActionsCell
            cell.actionButton.setTitle(userActions[indexPath.row].buttonTitle(), for: .normal)
            return cell
        }
    }
}

// MARK: - Section Enums
extension TableViewController {
    enum TableSection {
        case Title, Image, Price, Description, Actions
        
        func numberOfItems(userActions: [UserAction]) -> Int {
            switch self {
            case .Actions: return userActions.count
            default: return 1
            }
        }
        
        func sectionTitle() -> String{
            switch self {
            case .Price: return "Price"
            case .Description: return "Description"
            default: return ""
            }
        }
        
        func register(tableView: UITableView) {
            switch self {
            case .Title: registerNibForTableView(tableView: tableView, nibName: CarTitleCell.cellIdentifier())
            case .Image: registerNibForTableView(tableView: tableView, nibName: CarImageCell.cellIdentifier())
            case .Price: registerNibForTableView(tableView: tableView, nibName: CarPriceCell.cellIdentifier())
            case .Description: registerNibForTableView(tableView: tableView, nibName: CarDescriptionCell.cellIdentifier())
            case .Actions: registerNibForTableView(tableView: tableView, nibName: CarActionsCell.cellIdentifier())
            }
        }
        
        private func registerNibForTableView(tableView: UITableView, nibName: String) {
            let cell = UINib(nibName: nibName, bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: nibName)
        }
    }
}

// MARK: - Action Enums
extension TableViewController {
    enum UserAction {
        case Like, Share, ContactSeller
        
        func buttonTitle() -> String {
            switch self {
            case .Like: return "Like"
            case .Share: return "Share"
            case .ContactSeller: return "Contact with Seller"
            }
        }
    }
}

