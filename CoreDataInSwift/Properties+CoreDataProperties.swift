//
//  Properties+CoreDataProperties.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/23/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData


extension Properties {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Properties> {
        return NSFetchRequest<Properties>(entityName: "Properties");
    }

    @NSManaged public var gener: String?
    @NSManaged public var rating: Float
    @NSManaged public var anime: NSSet?

}

// MARK: Generated accessors for anime
extension Properties {

    @objc(addAnimeObject:)
    @NSManaged public func addToAnime(_ value: Anime)

    @objc(removeAnimeObject:)
    @NSManaged public func removeFromAnime(_ value: Anime)

    @objc(addAnime:)
    @NSManaged public func addToAnime(_ values: NSSet)

    @objc(removeAnime:)
    @NSManaged public func removeFromAnime(_ values: NSSet)

}
