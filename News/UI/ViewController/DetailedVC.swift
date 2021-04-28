//
//  DetailedVC.swift
//  News
//
//  Created by Сергей Александрович on 16.11.2020.
//

import UIKit
import CoreData

class DetailedVC: UIViewController{
    
    var article : Article?
    
    @IBOutlet private weak var myTitle: UILabel!
    @IBOutlet private weak var abstract: UILabel!
    @IBOutlet private weak var byline: UILabel!
    @IBOutlet private weak var published_date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTitle.text = article?.title
        abstract.text = article?.abstract
        byline.text = article?.byline
        published_date.text = article?.published_date
    }
    
    // MARK: - Actions
    @IBAction func openURL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string : article!.url)!)
    }
    
    @IBAction func addArticleToFavorites(_ sender: UIBarButtonItem) {
        let title: String = article!.title
        let abstract: String = article!.abstract
        let byline: String = article!.byline
        let published_date: String = article!.published_date
        let url: String = article!.url
        
        let article = Article(title: title, abstract: abstract, url: url, byline: byline, published_date:published_date)
        saveArticleToCoreData(withArticle: article)
    }
    
    // MARK: - Save to Core Data
    func saveArticleToCoreData(withArticle article: Article){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "FavoriteArticle", in: context) else { return }
        
        let ArticleObject = FavoriteArticle(entity: entity, insertInto: context)
        ArticleObject.title = article.title
        ArticleObject.abstract = article.abstract
        ArticleObject.byline = article.byline
        ArticleObject.published_date = article.published_date
        ArticleObject.url = article.url
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
