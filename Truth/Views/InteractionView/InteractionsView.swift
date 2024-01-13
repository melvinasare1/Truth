//
//  InteractionsView.swift
//  Truth
//
//  Created by Melvin Asare on 23/12/2023.
//

import UIKit

class InteractionsView: UIView {
    private weak var delegate: InteractionsViewDelegate!

    private lazy var likeButton: TruthButton = {
        let button = TruthButton(frame: .zero, tapHandler: likeArticle)
        button.positionImage(image: "heart", alignment: .center, isSFSymbol: true)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        return button
    }()
    
    private lazy var shareButton: TruthButton = {
        let button = TruthButton(frame: .zero, tapHandler: shareArticle)
        button.positionImage(image: "square.and.arrow.up", alignment: .center, isSFSymbol: true)
        button.configureBoarder(borderColor: UIColor.clear.cgColor, borderWidth: 0)
        button.configureBoarder(borderColor: nil, borderWidth: 0)
        button.configureBackground(background: .clear)
        return button
    }()
    
    private let likeCounter: TruthLabel = {
        let counter = TruthLabel()
        counter.configureText(textAlignment: .natural, titleText: "Pending")
        return counter
    }()
    
    @objc func shareArticle() {
        print("share article")
        self.delegate.shareButtonPressed()
    }
    
    @objc func likeArticle() {
        print("like article")
        self.delegate.likeButtonPressed()
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

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
