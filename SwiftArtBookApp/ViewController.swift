//
//  ViewController.swift
//  SwiftArtBookApp
//
//  Created by Fatih Tadık on 19.08.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableview: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var selectedPainting = ""
    var selectedPaintingID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableview.dataSource = self
        myTableview.delegate = self

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewItem))
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Notification -> Bildirimi dinle, newData diye bir bildirim alırsan, getData()' yı çalıştır.
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newData"), object: nil)
        
    }
    
    
    @objc func getData() {
        
        nameArray.removeAll(keepingCapacity: false) //keepingCapacity --> default olarak zaten false geliyor, hatırlatma için yazıldı...
        idArray.removeAll(keepingCapacity: false )
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Painting")
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        self.nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    
                    self.myTableview.reloadData()
                }
            }
            
        } catch {
            print("Error")
        }
    }
    
    
    @objc func addNewItem() {
        selectedPainting = "" // Eğer selectedPainting boş olursa, tableview'dan birşeye tıklanmadı demek... Yani + butonundan geldi ve normal işlemler geçerli...
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = nameArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            
            let destinationVc = segue.destination as! DetailsVC
            
            destinationVc.choosenPainting = selectedPainting
            destinationVc.choosenPaintingId = selectedPaintingID
            
            /*
            if let destinationVC = segue.destination as? DetailsVC {
                
                destinationVC.choosenPainting = selectedPainting
                destinationVC.choosenPaintingId = selectedPaintingID
                
            }
            */
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPainting = nameArray[indexPath.row] // SelectedPainting dolu gideceği için DetailsVC' de yeni fonksiyon çalışacak...
        selectedPaintingID = idArray[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }


}

