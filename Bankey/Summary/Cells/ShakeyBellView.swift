//
//  ShakeyBellView.swift
//  Bankey
//
//  Created by Bento, Cesar on 18/06/25.
//

import UIKit

class ShakeyBellView: UIView {
    
    let bellImageView = UIImageView()
    let notificationButtonView = UIButton()
    
    let buttonHeight: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
}

extension ShakeyBellView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        bellImageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        bellImageView.image = image
        
        notificationButtonView.translatesAutoresizingMaskIntoConstraints = false
        notificationButtonView.backgroundColor = .systemRed
        notificationButtonView.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        notificationButtonView.layer.cornerRadius = buttonHeight/2
        notificationButtonView.setTitle("9", for: .normal)
        notificationButtonView.setTitleColor(.white, for: .normal)
    }
    
    private func layout() {
        addSubview(bellImageView)
        addSubview(notificationButtonView)
        
        NSLayoutConstraint.activate([
            bellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bellImageView.heightAnchor.constraint(equalToConstant: 24),
            bellImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            notificationButtonView.topAnchor.constraint(equalTo: bellImageView.topAnchor),
            notificationButtonView.leadingAnchor.constraint(equalTo: bellImageView.trailingAnchor, constant: -9),
            notificationButtonView.widthAnchor.constraint(equalToConstant: 16),
            notificationButtonView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

extension ShakeyBellView {
    func setup() {
        let onTap = UITapGestureRecognizer(target: self, action: #selector(onBellTapped(_: )))
        bellImageView.addGestureRecognizer(onTap)
        bellImageView.isUserInteractionEnabled = true
    }
    
    @objc private func onBellTapped(_ recognizer: UITapGestureRecognizer) {
        shakeWith(duration: 1.0, angle: .pi/8, yOffset: 0.0)
    }
    
    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
            let numberOfFrames: Double = 6
            let frameDuration = Double(1/numberOfFrames)
            
        bellImageView.setAnchorPoint((CGPoint(x: 0.5, y: yOffset)))

            UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
              animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
                }
                UIView.addKeyframe(withRelativeStartTime: frameDuration,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
                }
                UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
                }
                UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
                }
                UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
                }
                UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                                   relativeDuration: frameDuration) {
                    self.bellImageView.transform = CGAffineTransform.identity
                }
              },
              completion: nil
            )
        }
}

// https://www.hackingwithswift.com/example-code/calayer/how-to-change-a-views-anchor-point-without-moving-it
extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
}

