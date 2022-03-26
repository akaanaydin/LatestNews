//
//  Webservice.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 25.03.2022.
//

import Foundation


class Webservice {
    
    func getArticels(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
    
    
    
    
    
    
    
}
