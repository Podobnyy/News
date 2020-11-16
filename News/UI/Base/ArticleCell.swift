//
//  ArticleCell.swift
//  News
//
//  Created by Сергей Александрович on 13.11.2020.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    
    func setup(article: Article){
        self.title.text = article.title
    }
}
