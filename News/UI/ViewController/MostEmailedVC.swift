//
//  MostEmailedVC.swift
//  News
//
//  Created by Сергей Александрович on 11.11.2020.
//

class MostEmailedVC : BaseVC {

    override func viewDidLoad() {
        
        title = "Most Emailed"
        super.urlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=tszG9eGfKwxdXAc1uyLD44LDaGUZAWAI"
        super.viewDidLoad()
    }
}
