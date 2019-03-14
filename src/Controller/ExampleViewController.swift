import UIKit
import CoreData

class ExampleViewController: UIViewController {

    @IBOutlet weak var animalsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateView()
    }

    @IBAction func addAnimal(_ sender: Any) {
        let animal = NSEntityDescription.insertNewObject(forEntityName: "Animal", into: self.viewContext) as! Animal
        animal.name = "Dog"
        try! self.viewContext.save()
        updateView()
    }
    
    @IBAction func reset(_ sender: Any) {
        CoreDataManager.sharedManager.resetCoreData()
        updateView()
    }
    
    func updateView() {
        self.animalsLabel.text = self.animals.map { $0.name ?? "" }.joined(separator: "\n")
    }
    
    var viewContext : NSManagedObjectContext {
        return CoreDataManager.sharedManager.persistentContainer.viewContext
    }
    
    var animals : [Animal] {
        let fetchRequest : NSFetchRequest<Animal> = Animal.fetchRequest()
        return try! self.viewContext.fetch(fetchRequest)
    }
}
