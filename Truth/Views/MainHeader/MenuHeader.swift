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
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Truth"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let notificationsButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
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
        addSubview(titleLabel)
        addSubview(stackView)

        stackView.addArrangedSubview(searchButton)
        stackView.addArrangedSubview(notificationsButton)

        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        
        stackView.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
