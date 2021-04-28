//
//  MostViewedVC.swift
//  News
//
//  Created by Сергей Александрович on 11.11.2020.
//

class MostViewedVC : BaseVC {

    override func viewDidLoad() {
        
        title = "Most Viewed"
        super.urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=tszG9eGfKwxdXAc1uyLD44LDaGUZAWAI"
        super.viewDidLoad()
    }
}
