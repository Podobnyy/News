//
//  Networking.swift
//  News
//
//  Created by Сергей Александрович on 29.04.2021.
//

import Foundation
import Alamofire

typealias articlesLoadComplitionalBlock = (_ result: [Article]?) -> ()

class Networking {

    static let shared = Networking()
    var articlesCompBlock: articlesLoadComplitionalBlock?
    
    // Get articles by URL
    func getArticles(urlString: String, complitional: @escaping articlesLoadComplitionalBlock){

        AF.request(urlString).responseJSON{ [weak self] response in
            var articlesResult = [Article] ()
            if let JSON = (response.value as? NSDictionary){
                let articlesRaw: Array = JSON["results"] as! Array<Any>
                for articleRaw in articlesRaw{
                    articlesResult.append((self?.getArticleFromDictionary(dictionary: articleRaw as! NSDictionary))!)
                }
            }
            complitional(articlesResult)
        }
    }
    
    // Create Article from dictionary
    private func getArticleFromDictionary(dictionary: NSDictionary) -> Article {
        let title: String = dictionary["title"] as! String
        let abstract: String = dictionary["abstract"] as! String
        let url: String = dictionary["url"] as! String
        let byline: String = dictionary["byline"] as! String
        let published_date: String = dictionary["published_date"] as! String
        
        return Article.init(title: title, abstract: abstract, url: url, byline: byline, published_date: published_date)
    }
}
