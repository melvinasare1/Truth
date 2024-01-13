//
//  TruthButton.swift
//  Truth
//
//  Created by Melvin Asare on 12/01/2024.
//

import UIKit


class TruthButton: UIButton {
    private var tapHandler: (() -> Void)?

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
    
    @objc func buttonTapped() {
        self.tapHandler?()
        print("fkmgkmf")
    }
    
    public func onPress() {
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        print("------")

    }
 
    public func configureBoarder(borderColor: CGColor?, borderWidth: CGFloat) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
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
    
    init(frame: CGRect, tapHandler: (() -> Void)?) {
        super.init(frame: frame)
        self.tapHandler = tapHandler
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Component: UnifyButton")
    }
}


private extension TruthButton {
    func setup() {
        addSubview(iconImageView)
        
        topAnchor.constraint(equalTo: topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        layer.cornerRadius = 20
        layer.borderWidth = 2
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
    }
}

