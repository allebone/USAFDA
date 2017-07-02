//
//  HomeViewController.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeViewController: UIViewController,SlideMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 21/255, green: 40/255, blue: 65/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        let menuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(SlideMenuController.openLeft))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        slideMenuController()?.addLeftGestures()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        slideMenuController()?.removeLeftGestures()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupStaticContent(){
        
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
