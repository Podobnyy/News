//
//  Article.swift
//  News
//
//  Created by Сергей Александрович on 13.11.2020.
//

import Foundation

struct Article: Codable{
    let title: String
    let abstract: String
    let url: String
    let byline: String
    let published_date: String
    
    init(title: String, abstract: String, url: String, byline: String, published_date: String){
        self.title = title
        self.abstract = abstract
        self.url = url
        self.byline = byline
        self.published_date = published_date
    }
}
