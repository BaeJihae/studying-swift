//
//  CustomTableViewCell.swift
//  Self-SizingTableViewCells
//
//  Created by 배지해 on 1/24/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var myIamgeView: UIImageView!
    var titleLabel: UILabel!
    var postLabel: UILabel!

    // postLabel을 늘리거나 줄이기 위한 제약을 걸 변수
    private var postHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myIamgeView = UIImageView()
        myIamgeView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(myIamgeView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
        
        postLabel = UILabel()
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.font = UIFont.preferredFont(forTextStyle: .body)
        postLabel.adjustsFontForContentSizeCategory = true
        postLabel.textColor = .darkGray
        postLabel.numberOfLines = 0
        
        postHeight = postLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, postLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            myIamgeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myIamgeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myIamgeView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            myIamgeView.widthAnchor.constraint(equalTo: myIamgeView.heightAnchor),
            myIamgeView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: myIamgeView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),            
            postHeight
        ])
        
        let tapGeture = UITapGestureRecognizer(target: self, action: #selector(togglePost))
        postLabel.addGestureRecognizer(tapGeture)
        postLabel.isUserInteractionEnabled = true
    }
    
    @objc private func togglePost() {
        guard let height = postHeight else {
            return
        }
        
        height.isActive = !height.isActive
        
        NotificationCenter.default.post(name: NSNotification.Name("layoutCell"), object: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
