//
//  InteractionsView.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class InteractionsView: UIView {
    public weak var delegate: InteractionsViewDelegate?

    private lazy var likeButton: TruthButton = {
        let button = TruthButton()
        button.positionImage(image: "heart", alignment: .center, isSFSymbol: true)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        button.addTarget(self, action: #selector(likeArticle), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: TruthButton = {
        let button = TruthButton(type: .system)
        button.positionImage(image: "square.and.arrow.up", alignment: .center, isSFSymbol: true)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        button.addTarget(self, action: #selector(shareArticle), for: .touchUpInside)
        return button
    }()
    
    private let likeCounter: TruthLabel = {
        let counter = TruthLabel()
        counter.configureText(textAlignment: .natural, titleText: "Pending")
        return counter
    }()
    
    @objc func shareArticle() {
        self.delegate?.shareButtonPressed()
    }
    
    @objc func likeArticle() {
        self.delegate?.likeButtonPressed()
    }

    private let stackView: TruthStackView = {
        let stackView = TruthStackView()
        stackView.configure(distribution: .fill, axis: .horizontal, spacing: 5)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.addArrangedSubview(shareButton)
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(likeCounter)

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        bottomAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
