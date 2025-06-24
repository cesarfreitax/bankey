//
//  SummaryViewControllerHeader.swift
//  Bankey
//
//  Created by Bento, Cesar on 25/04/25.
//

import UIKit

class SummaryHeaderView: UIView {
    @IBOutlet var view: UIView!
    
    let shakeyBellView = ShakeyBellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1000)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: SummaryHeaderView.self)
        bundle.loadNibNamed("SummaryHeaderView", owner: self, options: nil)
        addSubview(view)
        
        setupShakeyBell()
        
        view.backgroundColor = appColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension SummaryHeaderView {
    private func setupShakeyBell() {
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shakeyBellView)
        
        NSLayoutConstraint.activate([
            shakeyBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeyBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

