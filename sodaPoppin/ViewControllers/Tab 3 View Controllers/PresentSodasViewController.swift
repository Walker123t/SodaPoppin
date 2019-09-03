//
//  PresentSodasViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 9/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class PresentSodasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var sodaCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sodaCollectionView.dequeueReusableCell(withReuseIdentifier: "sodaCell", for: indexPath) as? SodaCollectionViewCell else { return UICollectionViewCell() }
        cell.sodaImageView.image = UIImage(named: "\(MyDrinksController.shared.sodas[indexPath.row]) Icon")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Soda"), object: MyDrinksController.shared.sodas[indexPath.row])
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
