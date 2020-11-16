//
//  ArticlesListViewController.swift
//  News
//
//  Created by Сергей Александрович on 13.11.2020.
//

import UIKit
import Alamofire
    
class ArticlesListViewController: UITableViewController {
        
    var dataSource = [Article]()
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
    }
    
    // Get articles by URL
    func getArticles() {
        AF.request(urlString).responseJSON { response in
            if let JSON = (response.value as? NSDictionary){
                let articles: Array = JSON["results"] as! Array<Any>
                for articleRaw in articles {
                    self.dataSource.append(self.getArticleFromDictionary(dictionary: articleRaw as! NSDictionary))
                }
            }
            self.tableView.reloadData()
        }
    }
    
    private func getArticleFromDictionary(dictionary: NSDictionary) -> Article {
        let title: String = dictionary["title"] as! String
        let abstract: String = dictionary["abstract"] as! String
        let url: String = dictionary["url"] as! String
        let byline: String = dictionary["byline"] as! String
        let published_date: String = dictionary["published_date"] as! String
        
        return Article.init(title: title, abstract: abstract, url: url, byline: byline, published_date: published_date)
    }
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.selectionStyle = .none
        
        if let cell = cell as? ArticleCell {
            cell.setup(article: dataSource[indexPath.row])
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openDetailedVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openDetailedVC" {
            if let destinationVC = segue.destination as? DetailedViewController {
                destinationVC.article = dataSource[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}
