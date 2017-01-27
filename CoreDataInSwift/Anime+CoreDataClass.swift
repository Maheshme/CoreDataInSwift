//
//  Anime+CoreDataClass.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/23/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData


public class Anime: CustomManagedObject {
    
    override class func modelName() -> String{
        return "Anime"
    }
    
    class func getDetailsOfAnime(name: String!, context: NSManagedObjectContext!) throws -> Anime {
        
        guard let _ = name, let _ = context  else {
            throw coreDataError.wrongData
        }
        
        let pred: NSPredicate = NSPredicate.init(format: "name = %@", name)
        do{
            let arrarOfData = try self.getDataUsingPredicate(pred: pred, modelName: self.modelName(), context: context) as! [Anime]
            
            if arrarOfData.count == 0 {
                throw coreDataError.noData
            }
            else{
                return arrarOfData.first!
            }
        }catch{
            throw coreDataError.fetchFailed
        }
    }
    
    class func getDetailsOfAnime(name: String)throws -> Anime{
        do{
            let data = try self.getDetailsOfAnime(name: name, context: self.context())
            return data
        }catch let err{
            throw err
        }
    }
}
