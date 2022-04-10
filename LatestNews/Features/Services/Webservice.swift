//
//  Webservice.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 25.03.2022.
//

import Alamofire

enum LatestNewsWebServiceEndPoint: String {
    case BASE_URL = "https://newsapi.org/v2"
    case PATH = "/top-headlines?country=us&apiKey="
    case API_KEY = "2cf47fd0502144d590c46bf2a61d7892"
    
    static func newsPath() -> String {
        "\(BASE_URL.rawValue)\(PATH.rawValue)\(API_KEY.rawValue)"
    }
}




protocol ILatestNewsWebService {
    func fetchAllDatas(response: @escaping ([Article]?) -> Void)
}



struct LatestNewsWebService: ILatestNewsWebService {
    func fetchAllDatas(response: @escaping ([Article]?) -> Void) {
        AF.request(LatestNewsWebServiceEndPoint.newsPath()).responseDecodable(of: ArticleList.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.articles)
        }
    }
    
    
}
