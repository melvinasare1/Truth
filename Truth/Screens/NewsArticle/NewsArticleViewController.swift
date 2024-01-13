//
//  NewsArticleViewController.swift
//  Truth
//
//  Created by Melvin Asare on 07/01/2024.
//

import UIKit
import SDWebImage

class NewsArticleViewController: UIViewController {
    private let viewModel: NewsArticleViewModel!
    
    private let authorDetails = AuthorDetails()
    private let interactionView = InteractionsView()
    private let contentLabel = TruthLabel()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "picture")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let readMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read More", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(readMorePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func readMorePressed() {
        UIApplication.shared.open(viewModel.url)
    }
    
    init(viewModel: NewsArticleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public func configureArticle(name: String, date: String, image: String, content: String) {
        authorDetails.setAuthorDetails(name: name, publishedDate: date)
        imageView.sd_setImage(with: URL(string: viewModel.image, relativeTo: nil))
        contentLabel.text = content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        addSubviews()
        setConstraints()
        
        configureArticle(name: viewModel.authorName, date: viewModel.publishedDate, image: viewModel.image, content: viewModel.content)
 
        authorDetails.isFullArticle(true)
    }
}

extension NewsArticleViewController {
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(authorDetails)
        view.addSubview(interactionView)
        view.addSubview(contentLabel)
        view.addSubview(readMoreButton)
    }
    
    private func setConstraints() {
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true

        authorDetails.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        authorDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        authorDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        interactionView.topAnchor.constraint(equalTo: authorDetails.bottomAnchor, constant: 24).isActive = true
        interactionView.leadingAnchor.constraint(equalTo: authorDetails.leadingAnchor).isActive = true
        interactionView.trailingAnchor.constraint(equalTo: authorDetails.trailingAnchor).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: interactionView.bottomAnchor, constant: 16).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: interactionView.leadingAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: interactionView.trailingAnchor).isActive = true
        
        readMoreButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 24).isActive = true
        readMoreButton.leadingAnchor.constraint(equalTo: authorDetails.leadingAnchor).isActive = true
        readMoreButton.trailingAnchor.constraint(equalTo: authorDetails.trailingAnchor).isActive = true
    }
}

extension NewsArticleViewController: InteractionsViewDelegate {
    func shareButtonPressed() {
        print("1234")
    }
    
    func likeButtonPressed() {
        print("3456")

    }
    
    
}
