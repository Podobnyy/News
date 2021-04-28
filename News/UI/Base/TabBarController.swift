//
//  TabBarController.swift
//  News
//
//  Created by Сергей Александрович on 11.11.2020.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let items = self.tabBar.items else{
            return
        }
        let titles = ["Most Emailed", "Most Shared", "Most Viewed", "My Favorite"]
        let images = ["envelope","airplane","eye","star"]

        for x in 0..<items.count {
            items[x].title = titles[x]
            items[x].image = UIImage(systemName: images[x])
        }
    }
}

