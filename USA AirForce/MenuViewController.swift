//
//  MenuViewController.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let menuTitles = AppSession.shared.uniformContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup(){
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: 21/255, green: 40/255, blue: 65/255, alpha: 1.0)
        cell.textLabel?.text = menuTitles[indexPath.row].title
        cell.textLabel?.textColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        slideMenuController()?.closeLeft()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: SegueIdentifier.DetailViewController) as! DetailViewController
        vc.subContent = menuTitles[indexPath.row].content
        vc.title =  menuTitles[indexPath.row].title
//        vc.isSubtitle = true
        let navVC = self.slideMenuController()?.mainViewController as! UINavigationController
        navVC.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
