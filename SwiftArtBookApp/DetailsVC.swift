//
//  DetailsVC.swift
//  SwiftArtBookApp
//
//  Created by Fatih Tadık on 19.08.2025.
//

import UIKit

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //-------Recognizer-------
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        myImageview.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        myImageview.addGestureRecognizer(imageTapRecognizer)
        

    }
    
    @objc func selectImage() {
        // picker işlemlerini yapabilmek için ->  UIImagePickerControllerDelegate ve UINavigationControllerDelegate sınıflarından miras alıyoruz...
        
        // --------Kullanıcı izni---------
        // Yeni versiyonlarda kullanıcı izni almak kaldırıldı...
        // Eski versiyonlara ürün çıkartıyorsak onlar için zorunlu!..
        // -> info dosyasından + ' ya tıkla, --> Privacy - Photo Library Usage Description <-- bunu seç ve neden kullanmak istediğinle ilgili açıklama ekle...
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImageview.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
    }
    

}
