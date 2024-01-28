//
//  TruthButton.swift
//  Truth
//
//  Created by Melvin Asare on 12/01/2024.
//

import UIKit
import SkeletonView

enum ButtonVariant {
    case filled
    case unfilled
    case outline
}

class TruthButton: UIButton {
    
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public func configure(text: String, color: UIColor? = .white) {
        setTitleColor(color, for: .normal)
        setTitle(text, for: .normal)
    }
    
    public func configureBackground(background: UIColor? = .systemBlue) {
        backgroundColor = background
    }
    
    public func configureBoarder(borderColor: CGColor?, borderWidth: CGFloat) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    
    public func setFilledButton(color: UIColor? = .systemBlue) {
        backgroundColor = color
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
    }
    
    public func setOutlinedButton() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .white
    }
    
    public func setUnfilledButton() {
        backgroundColor = .clear
        layer.borderWidth = 0
    }
    
    public func variant(variant: ButtonVariant) {
        switch variant {
        case .filled:
            setFilledButton()
            break
        case .outline:
            setOutlinedButton()
            break
        case .unfilled:
            setUnfilledButton()
            break
        }
    }
    
    private func leftPosition(image: String) {
        titleLabel?.textAlignment = .right
        iconImageView.image = UIImage(named: image)
        
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func rightPosition(image: String) {
        titleLabel?.textAlignment = .left
        iconImageView.image = UIImage(named: image)
        
        iconImageView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func centerPosition(image: String, isSFSymbol: Bool) {
        iconImageView.image = isSFSymbol ? UIImage(systemName: image) : UIImage(named: image)
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    public func positionImage(image: String, alignment: NSTextAlignment, isSFSymbol: Bool) {
        switch alignment {
        case .left:
            leftPosition(image: image)
        case .center:
            centerPosition(image: image, isSFSymbol: isSFSymbol)
        case .right:
            rightPosition(image: image)
        default:
            centerPosition(image: image, isSFSymbol: isSFSymbol)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Component: UnifyButton")
    }
}


private extension TruthButton {
    func setup() {
        self.addSubview(iconImageView)
                
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 20
        
        self.isSkeletonable = true
    }
}
