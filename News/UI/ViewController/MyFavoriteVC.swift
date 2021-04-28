//
//  MyFavoriteVC.swift
//  News
//
//  Created by Сергей Александрович on 11.11.2020.
//

import UIKit
import CoreData

class MyFavoriteVC: BaseVC {
    
    override func viewDidLoad() {
        title = "My Favorite"
        self.dataSource.removeAll()
        getArticles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataSource.removeAll()
        getArticles()
    }
    
    // override Get articles by Core Data
    func getArticles(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FavoriteArticle> = FavoriteArticle.fetchRequest()

        var articles = [FavoriteArticle]()
        do {
            articles = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }

        for article in articles {
            self.dataSource.append(self.getArticleFromFavoriteArticle(favoriteArticle: article))
        }
        self.tableView.reloadData()
    }

    func getArticleFromFavoriteArticle(favoriteArticle: FavoriteArticle) -> Article {
        let title: String = favoriteArticle.title!
        let abstract: String = favoriteArticle.abstract!
        let url: String = favoriteArticle.url!
        let byline: String = favoriteArticle.byline!
        let published_date: String = favoriteArticle.published_date!

        return Article.init(title: title, abstract: abstract, url: url, byline: byline, published_date: published_date)
    }
}
