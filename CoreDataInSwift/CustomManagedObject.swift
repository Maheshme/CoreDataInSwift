//
//  CustomManagedObject.swift
//  CoreDataSwifter
//
//  Created by Mahesh.me on 1/12/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum coreDataError: Error {
    case wrongData
    case noData
    case fetchFailed
}


public class CustomManagedObject: NSManagedObject{
    
    class func modelName() -> String{
        return ""
    }
    
    class func context() -> NSManagedObjectContext{
        let appDlegate = UIApplication.shared.delegate as! AppDelegate
        return appDlegate.managedObjectContext
    }
    
    class func privateContext() -> NSManagedObjectContext{
        let privateContext: NSManagedObjectContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        privateContext.parent = context()
        return privateContext
    }
    
    class func addNewInContext(context: NSManagedObjectContext) -> Any{
        let managedObj: NSManagedObject!
        managedObj = NSEntityDescription.insertNewObject(forEntityName: self.modelName(), into: context)
        if managedObj == nil {
            print("Core data Error")
        }
        return managedObj as Any
    }
    
    class func addNew() -> Any{
       return addNewInContext(context:self.context())
    }
    
    class func saveInContext(context :NSManagedObjectContext) -> Bool{
        do{
            try context.save()
        }catch{
            print("failed to save")
            return false
        }
        return true
    }
    
    class  func save() -> Bool{
        return CustomManagedObject.saveInContext(context: context())
    }
    
    func refreshContext(context: NSManagedObjectContext, mergeChnages: Bool){
        context.refresh(self, mergeChanges: mergeChnages)
    }
    
    func refesh(mergeChanges: Bool){
        refreshContext(context:CustomManagedObject.context() , mergeChnages: mergeChanges)
    }
    
    class func getDataUsingPredicate(pred: NSPredicate, modelName: String, context: NSManagedObjectContext)throws -> [Any]{
        
        let req: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: modelName)
        req.entity = NSEntityDescription.entity(forEntityName: modelName, in: context)
        req.includesPropertyValues = true
        req.predicate = pred
        req.fetchLimit = 1
        do{
            return try context.fetch(req)
        }catch{
            throw coreDataError.fetchFailed
        }
    }
}
