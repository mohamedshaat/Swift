//
//  LeftMenuViewController.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/7/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case go
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}


class LeftMenuViewController: UIViewController , LeftMenuProtocol, UITableViewDelegate, UITableViewDataSource {
     var mainViewController: UIViewController!
    @IBOutlet weak var tableView: UITableView!
       var menus = ["Main", "Swift", "Java", "Go", "NonMenu"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func changeViewController(_ menu: LeftMenu) {
        
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier:"cellForRightMenu") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = menus[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
}


