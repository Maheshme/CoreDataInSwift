//
//  Anime+CoreDataProperties.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/23/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData


extension Anime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Anime> {
        return NSFetchRequest<Anime>(entityName: "Anime");
    }

    @NSManaged public var episodes: Int16
    @NSManaged public var name: String?
    @NSManaged public var properties: Properties?
    @NSManaged public var state: State?

}
