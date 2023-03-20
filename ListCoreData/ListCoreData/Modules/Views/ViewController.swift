//
//  ViewController.swift
//  ListCoreData
//
//  Created by abhishek on 14/03/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var specialForcesList : UITableView!
   
    //var namesOfForces : [String] = []
    
    //MARK: PROPERTIES
    var namesOfForces:[NSManagedObject] = []
    
    //MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Special Forces"
        specialForcesList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        specialForcesList.isEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SpecialForces")
        do{
            namesOfForces = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    
    //MARK: PUBLIC METHODS
    func save(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "SpecialForces", in: managedContext) else { return  }
        let forceList = NSManagedObject.init(entity: entity, insertInto: managedContext)
        forceList.setValue(name, forKey: "name")
        do {

            try managedContext.save()
            namesOfForces.append(forceList)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: IBActions
    @IBAction func addNameBtn(_sender : UIBarButtonItem){
        
        let alert = UIAlertController(title: "Special-Forces", message: "Add-New-Force", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default){  action in
            
            print(action.isEnabled)
            
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {return}
            
//            self.namesOfForces.append(nameToSave)
            self.save(name: nameToSave)
            self.specialForcesList.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    

}

//MARK: EXTENSIONS
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesOfForces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = specialForcesList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       // cell.textLabel?.text = namesOfForces[indexPath.row]
        
        let forcesList = namesOfForces[indexPath.row]
        cell.textLabel?.text = forcesList.value(forKey: "name") as? String
        return cell
    }
    
    
}
