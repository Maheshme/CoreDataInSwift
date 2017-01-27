//
//  Properties+CoreDataClass.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/23/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData


public class Properties: CustomManagedObject {
    
    override class func modelName() -> String{
        return "Properties"
    }

}
