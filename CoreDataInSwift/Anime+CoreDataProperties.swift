//
//  Anime+CoreDataProperties.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/20/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Anime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Anime> {
        return NSFetchRequest<Anime>(entityName: "Anime");
    }

    @NSManaged public var name: String?
    @NSManaged public var genre: String?
    @NSManaged public var episodes: Int16
    @NSManaged public var ended: Bool

}
