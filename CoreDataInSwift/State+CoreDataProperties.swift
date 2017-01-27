//
//  State+CoreDataProperties.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/23/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import Foundation
import CoreData


extension State {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<State> {
        return NSFetchRequest<State>(entityName: "State");
    }

    @NSManaged public var isAiring: Bool
    @NSManaged public var hasEnglishSub: Bool
    @NSManaged public var hasEnglishDub: Bool
    @NSManaged public var anime: NSSet?

}

// MARK: Generated accessors for anime
extension State {

    @objc(addAnimeObject:)
    @NSManaged public func addToAnime(_ value: Anime)

    @objc(removeAnimeObject:)
    @NSManaged public func removeFromAnime(_ value: Anime)

    @objc(addAnime:)
    @NSManaged public func addToAnime(_ values: NSSet)

    @objc(removeAnime:)
    @NSManaged public func removeFromAnime(_ values: NSSet)

}
