//
//  MenuHeader.swift
//  Truth
//
//  Created by Melvin Asare on 30/12/2023.
//

import UIKit
import SkeletonView

protocol MenuHeaderDelegate: AnyObject {
    func searchButtonPressed()
    func notificationButtonPressed()
}

class MenuHeader: UIView {
    
    private weak var delegate: MenuHeaderDelegate!
    
    private let titleLabel: TruthLabel = {
       let label = TruthLabel()
        label.configureTitleSize(fontSize: 24, weight: .bold)
        label.configureText(textAlignment: .left, titleText: "Truth")
        
        return label
    }()
    
    private lazy var searchButton: TruthButton = {
        let button = TruthButton()
        button.positionImage(image: "magnifyingglass", alignment: .natural, isSFSymbol: true)
        button.configureBoarder(borderColor: UIColor.clear.cgColor, borderWidth: 0)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        return button
    }()
    
    private lazy var notificationsButton: TruthButton = {
        let button = TruthButton()
        button.positionImage(image: "bell.fill", alignment: .natural, isSFSymbol: true)
        button.configureBoarder(borderColor: UIColor.clear.cgColor, borderWidth: 0)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        return button
    }()
    
    @objc func notificationsButtonPressed() {
        
    }
    
    @objc func searchButtonPressed() {
        
    }
 
    private let stackView: TruthStackView = {
        let stackView = TruthStackView()
        stackView.configure(distribution: .fill, axis: .horizontal, spacing: 12)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSkeletonable = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuHeader {
    
    private func setConstraints() {
        stackView.addArrangedSubview(searchButton)
        stackView.addArrangedSubview(notificationsButton)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        
        stackView.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        topAnchor.constraint(equalTo: topAnchor, constant: -5).isActive = true
        bottomAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(stackView)
    }
}
