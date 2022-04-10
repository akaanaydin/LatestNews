//
//  LatestNewsTableViewCell.swift
//  LatestNews
//
//  Created by Arslan Kaan AYDIN on 10.04.2022.
//

import UIKit
import SnapKit

class LatestNewsTableViewCell: UITableViewCell {
    
    private let titleCell: UILabel = UILabel()
    private let descriptionCell: UILabel = UILabel()
    
    
    
    enum Identifier: String {
        case custom = "AKA"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews()
        drawDesign()
        maketitleCell()
        makedescriptionCell()
    }
    
    
    func saveModel(model: Article) {
        descriptionCell.text = model.description
        titleCell.text = model.title
    }
    
    private func drawDesign() {
        descriptionCell.numberOfLines = 5
        titleCell.numberOfLines = 2

        DispatchQueue.main.async {
            self.titleCell.font = .boldSystemFont(ofSize: 15)
            self.descriptionCell.font = .italicSystemFont(ofSize: 12)
        }
    }
    
    private func addSubviews() {
        addSubview(titleCell)
        addSubview(descriptionCell)
    }

}

extension LatestNewsTableViewCell {
    
    private func maketitleCell() {
        titleCell.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.right.equalTo(contentView)
            make.height.greaterThanOrEqualTo(10)
        }
        
    }
    
    private func makedescriptionCell() {
        descriptionCell.snp.makeConstraints { make in
            make.top.equalTo(titleCell.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
        }
        
    }
}
