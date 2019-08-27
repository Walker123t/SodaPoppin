//
//  DiscoverContainerViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DiscoverContainerViewController: UIPageViewController {

    let allViewControllers = [
        UIStoryboard(name: "tab1", bundle: nil).instantiateViewController(withIdentifier: "DiscoverPoppinContainerViewController"),
        UIStoryboard(name: "tab1", bundle: nil).instantiateViewController(withIdentifier: "DiscoverFilterViewController")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([allViewControllers.first!], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
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
