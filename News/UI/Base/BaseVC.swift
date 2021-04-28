//
//  BaseVC.swift
//  News
//
//  Created by Сергей Александрович on 13.11.2020.
//

import UIKit
    
class BaseVC: UITableViewController {
        
    var dataSource = [Article]()
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Networking.shared.getArticles(urlString: urlString) { [weak self](articles) in
            if let articles = articles{
                self?.dataSource = articles
                DispatchQueue.main.async{
                    self?.tableView.reloadData()
                }
            }
        }
    }
        
    // MARK: - UITableViewDataSource
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
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openDetailedVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openDetailedVC" {
            if let destinationVC = segue.destination as? DetailedVC {
                destinationVC.article = dataSource[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}
