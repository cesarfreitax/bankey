//
//  SummaryCellView.swift
//  Bankey
//
//  Created by Bento, Cesar on 29/04/25.
//

import UIKit

class SummaryCell: UITableViewCell {
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let balanceDetailsImageButton = UIImageView()
    
    static let reuseID = "SummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SummaryCell {
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        contentView.addSubview(typeLabel)
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor
        
        contentView.addSubview(underlineView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        
        contentView.addSubview(nameLabel)
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 4
        balanceStackView.alignment = .trailing
        contentView.addSubview(balanceStackView)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Some balance"
        balanceStackView.addArrangedSubview(balanceLabel)
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
//        balanceAmountLabel.text = "$100.00"
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "984,23", cents: "05")
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        balanceDetailsImageButton.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        balanceDetailsImageButton.image = chevronImage
        contentView.addSubview(balanceDetailsImageButton)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            // Account type
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            
            // Type color
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            
            // Account name
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            
            // Balance stackview
            balanceDetailsImageButton.trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 3),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.topAnchor, multiplier: 1),
            
            // Balance details image button
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceDetailsImageButton.trailingAnchor, multiplier: 1),
            balanceDetailsImageButton.topAnchor.constraint(equalToSystemSpacingBelow: balanceStackView.topAnchor, multiplier: 1),
        ])
    }
}

extension SummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
