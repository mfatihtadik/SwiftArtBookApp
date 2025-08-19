//
//  DetailsVC.swift
//  SwiftArtBookApp
//
//  Created by Fatih Tadık on 19.08.2025.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        

    }
    
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
    }
    

}
