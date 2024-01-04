//
//  InteractionsView.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class InteractionsView: UIView {
    private weak var delegate: InteractionsViewDelegate!
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Like", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(InteractionsView.self, action: #selector(likeArticle), for: .touchUpInside)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.addTarget(InteractionsView.self, action: #selector(shareArticle), for: .touchUpInside)
        return button
    }()
    
    private let likeCounter: UILabel = {
        let counter = UILabel()
        counter.text = "5"
        counter.translatesAutoresizingMaskIntoConstraints = false
        return counter
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func shareArticle() {
        self.delegate.shareButtonPressed()
    }
    
    @objc func likeArticle() {
        self.delegate.likeButtonPressed()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.addArrangedSubview(shareButton)
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(likeCounter)

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
