//
//  DrinksPageViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinksPageViewController: UIPageViewController {

    let allTableViewControllers = [
        UIStoryboard(name: "tab3", bundle: nil).instantiateViewController(withIdentifier: "MyDrinks"),
        UIStoryboard(name: "tab3", bundle: nil).instantiateViewController(withIdentifier: "MyInventory"),
        UIStoryboard(name: "tab3", bundle: nil).instantiateViewController(withIdentifier: "ShoppingList")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([allTableViewControllers.first!], direction: .forward, animated: true, completion: nil)
    }
}

func notificationsForUnderline(index: Int) {
    if index == 0 {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "myDrinks"), object: nil)
    } else if index == 1 {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "myInventory"), object: nil)
    } else {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "shoppingList"), object: nil)
    }
}



extension DrinksPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Find the index of the current table view
        guard let index = allTableViewControllers.firstIndex(of: viewController) else { return UITableViewController() }
        // If this is the first tableview, there is no tableview before it, so:
        if index == 0 {
            return nil
        }
        // Get the index of my previous table view controller
        let newIndex = index - 1
        notificationsForUnderline(index: newIndex)
        return allTableViewControllers[newIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allTableViewControllers.firstIndex(of: viewController) else { return UITableViewController() }
        if index == allTableViewControllers.count - 1 {
            return nil
        }
        let newIndex = index + 1
        notificationsForUnderline(index: newIndex)
        return allTableViewControllers[newIndex]
    }
    
    
}
