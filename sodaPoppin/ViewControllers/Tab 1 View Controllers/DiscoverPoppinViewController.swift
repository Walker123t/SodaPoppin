//
//  DiscoverPoppinViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DiscoverPoppinViewController: UIViewController {

    @IBOutlet weak var poppinButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var poppinUnderline: UIView!
    @IBOutlet weak var filterUnderline: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To take out the line between the navigation bar and the purple view at the top of the page
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let allViewControllers = [
            UIStoryboard(name: "tab1", bundle: nil).instantiateViewController(withIdentifier: "DiscoverPoppinContainerViewController"),
            UIStoryboard(name: "tab1", bundle: nil).instantiateViewController(withIdentifier: "DiscoverFilterViewController")
        ]
        
//        NotificationCenter.default.addObserver(self, selector: #selector(myDrinks), name: Notification.Name(rawValue: "myDrinks"), object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func poppinButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
