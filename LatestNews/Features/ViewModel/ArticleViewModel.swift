//
//  ArticleViewModel.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 26.03.2022.
//

import Foundation
import UIKit


protocol ILatestNewsViewModel {
    func fetchItems()
    
    var latestNewsArticles: [Article] { get set }
    var latestNewsWebService: ILatestNewsWebService { get }
    var latestNewsOutput: LatestNewsOutput? { get }
    
    func setDelegate(output: LatestNewsOutput)
}



final class LatestNewsViewModel: ILatestNewsViewModel {
    
    var latestNewsOutput: LatestNewsOutput?
    var latestNewsArticles: [Article] = []
    var latestNewsWebService: ILatestNewsWebService
    
    init() {
        latestNewsWebService = LatestNewsWebService()
    }
    
    func setDelegate(output: LatestNewsOutput) {
        latestNewsOutput = output
    }
    
    func fetchItems() {
        latestNewsWebService.fetchAllDatas { [weak self] response in
            self?.latestNewsArticles = response ?? []
            self?.latestNewsOutput?.saveDatas(values: self?.latestNewsArticles ?? [])
        }
    }
}
