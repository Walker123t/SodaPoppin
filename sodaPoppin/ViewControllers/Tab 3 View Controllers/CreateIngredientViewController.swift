//
//  CreateIngredientViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/21/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class CreateIngredientViewController: UIViewController {

    @IBOutlet weak var createIngredientTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseButtonTapped(_ sender: Any) {
<<<<<<< HEAD
=======
        guard let customIngredient = createIngredientTextField.text else {return}
        MyDrinksController.sharedInstance.ingredients.append(customIngredient)
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        navigationController?.popViewController(animated: true)
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
