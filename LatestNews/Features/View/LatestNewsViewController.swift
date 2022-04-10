//
//  LatestNewsViewController.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 24.03.2022.
//

import UIKit
import SnapKit


protocol LatestNewsOutput {
    func saveDatas(values: [Article])
}


final class LatestNewsViewController: UIViewController {
    
    private let mainTableView: UITableView = UITableView()
    private let labelTitle: UILabel = UILabel()
    private let navigationBar: UINavigationBar = UINavigationBar()
    
    private lazy var articles: [Article] = []
    
    lazy var viewModel: ILatestNewsViewModel = LatestNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    
    private func configure() {
        addSubviews()
        drawDesign()
        makeTableView()
        makeLabelTitle()
    }
    
    
    private func addSubviews() {
        view.addSubview(mainTableView)
        view.addSubview(labelTitle)
        view.addSubview(navigationBar)
    }
    
    private func drawDesign() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(LatestNewsTableViewCell.self, forCellReuseIdentifier: LatestNewsTableViewCell.Identifier.custom.rawValue)
        mainTableView.rowHeight = 130

        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Latest News"
        }
    }
}

extension LatestNewsViewController: LatestNewsOutput {
    func saveDatas(values: [Article]) {
        articles = values
        mainTableView.reloadData()
    }
}

extension LatestNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LatestNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: LatestNewsTableViewCell.Identifier.custom.rawValue) as? LatestNewsTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: articles[indexPath.row])
        return cell
    }
}

extension LatestNewsViewController {
    private func makeTableView() {
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeLabelTitle() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
