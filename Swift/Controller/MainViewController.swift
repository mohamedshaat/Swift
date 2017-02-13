//
//  MainViewController.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/7/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit
import

DGElasticPullToRefresh
import SlideMenuControllerSwift
import EZLoadingActivity
class MainViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    
     var menus = ["Scroll With keyboard behavior&loading&&tab to dismiss keyboard", "localization arabic", "localization english", "localization arabic apple way", "NonMenu"]
    var loadingData = false
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItem()
        initPullToRefresh()
        initLoadMoreToRefresh()
      //  self.hideKeyboard()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         MoLocalization .setCurrentLang(lang: Constants.Language.ENGLISH)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    // create a cell for each table view row
       
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:BaseCellTableViewCell = self.tableView.dequeueReusableCell(withIdentifier:"cellForRightMenu") as UITableViewCell! as! BaseCellTableViewCell
        
        // set the text from the data model
        cell.catogeryName?.text = menus[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if (indexPath.row==0)
        {
        performSegue(withIdentifier: "SEQ_FROM_TABLEVIEW_TO_LOGIN", sender: nil)
        }
        else
        if(indexPath.row==1)
        {
            MoLocalization .setCurrentLang(lang: Constants.Language.ARABIC)
            performSegue(withIdentifier: "SEQ_FROM_TABLEVIEW_TO_LOCALIZATION", sender: nil)
        }
        else
            if(indexPath.row==2)
            {
                MoLocalization .setCurrentLang(lang: Constants.Language.ENGLISH)
                performSegue(withIdentifier: "SEQ_FROM_TABLEVIEW_TO_LOCALIZATION", sender: nil)
        }
        else if(indexPath.row==3)
            {
                
                MoLocalization .setCurrentLang(lang: Constants.Language.ARABIC)
                performSegue(withIdentifier: "SEQ_FROM_TABLEVIEW_TO_LOCALIZATION_APPLEWAY", sender: nil)
                
               }
         
        
    }
    
    
    
    
}
extension MainViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
    
   func initPullToRefresh()
    {
    let loadingView = DGElasticPullToRefreshLoadingViewCircle()
    loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
    tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
    // Add your logic here
    // Do not forget to call dg_stopLoading() at the end
    self?.tableView.dg_stopLoading()
    }, loadingView: loadingView)
        
tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
    tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
 func initLoadMoreToRefresh()
   {
    tableView.infiniteScrollIndicatorStyle = .gray
    
    // Add infinite scroll handler
    tableView.addInfiniteScroll { (tableView) -> Void in
        //
        // fetch your data here, can be async operation,
        // just make sure to call finishInfiniteScroll in the end
        //
        
        let indexPaths = [NSIndexPath]() // index paths of updated rows
        
        // make sure you update tableView before calling -finishInfiniteScroll
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths as [IndexPath], with: .automatic)
        tableView.endUpdates()
        
        // finish infinite scroll animation
        tableView.finishInfiniteScroll()
    }
    
    }
    
}
