//
//  SummaryViewControllerHeader.swift
//  Bankey
//
//  Created by Bento, Cesar on 25/04/25.
//

import UIKit

class SummaryHeaderView: UIView {
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: SummaryHeaderView.self)
        bundle.loadNibNamed("SummaryHeaderView", owner: self, options: nil)
        addSubview(view)
        view.backgroundColor = appColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}


