//
//  DetailViewController.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var subContent:[DetailModel]?
    var isSubtitle:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    func initialSetup(){
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "kCell")
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .done, target: self, action: #selector(DetailViewController.popController))
        tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subContent!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSubtitle == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "kCell", for: indexPath)
            cell.textLabel?.text = subContent?[indexPath.row].header
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageCell
            cell.prodTitle.text = subContent?[indexPath.row].header
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = subContent?[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: SegueIdentifier.InfoViewController) as! InfoViewController
        vc.detailObj = object
        vc.title = object?.header
        self.navigationController?.pushViewController(vc,animated:true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSubtitle == true{
            return 80
        }
        return 125
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
        Male Formal Dress Uniforms , Female Formal Dress Uniforms . Those can be added as category along with the uniform name.
     */
}
