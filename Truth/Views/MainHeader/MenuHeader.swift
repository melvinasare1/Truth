//
//  MenuHeader.swift
//  Truth
//
//  Created by Melvin Asare on 30/12/2023.
//

import UIKit

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
        let button = TruthButton(frame: .zero, tapHandler: searchButtonPressed)
        button.positionImage(image: "magnifyingglass", alignment: .natural, isSFSymbol: true)
        return button
    }()
    
    private lazy var notificationsButton: TruthButton = {
        let button = TruthButton(frame: .zero, tapHandler: notificationsButtonPressed)
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func notificationsButtonPressed() {
        
    }
    
    @objc func searchButtonPressed() {
        
    }
 
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(stackView)
    }
}
