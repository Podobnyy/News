//
//  MostShared.swift
//  News
//
//  Created by Сергей Александрович on 11.11.2020.
//

class MostShared : ArticlesListViewController {
    
    override func viewDidLoad() {
        
        title = "Most Shared"
        super.urlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=tszG9eGfKwxdXAc1uyLD44LDaGUZAWAI"
        super.viewDidLoad()
    }
}
