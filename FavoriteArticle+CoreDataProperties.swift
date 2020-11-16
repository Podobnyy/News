//
//  FavoriteArticle+CoreDataProperties.swift
//  
//
//  Created by Сергей Александрович on 16.11.2020.
//
//

import Foundation
import CoreData


extension FavoriteArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteArticle> {
        return NSFetchRequest<FavoriteArticle>(entityName: "FavoriteArticle")
    }

    @NSManaged public var title: String?
    @NSManaged public var published_date: String?
    @NSManaged public var abstract: String?
    @NSManaged public var byline: String?
    @NSManaged public var url: String?

}
