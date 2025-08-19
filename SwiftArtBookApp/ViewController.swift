//
//  ViewController.swift
//  SwiftArtBookApp
//
//  Created by Fatih Tadık on 19.08.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewItem))
        

        
    }
    
    
    @objc func addNewItem() {
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }

}

