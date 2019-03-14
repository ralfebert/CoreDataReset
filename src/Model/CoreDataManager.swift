import CoreData

class CoreDataManager {
    
    let storeName = "Animals"
    static let sharedManager = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: storeName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func resetCoreData(){
        
        guard let firstStore = self.persistentContainer.persistentStoreCoordinator.persistentStores.first else {
            print("Missing first store URL - could not destroy")
            return
        }
        
        do {
            try self.persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: firstStore.url!, ofType: NSSQLiteStoreType, options: nil)
        } catch  {
            print("Unable to destroy persistent store: \(error) - \(error.localizedDescription)")
        }

        self.persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
