//
//  HomeViewController.swift
//  Truth
//
//  Created by Melvin Asare on 22/12/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var horizontalLayout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 6, trailing: 12)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.9))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    private var newsTypeLayout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                               heightDimension: .fractionalHeight(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    private lazy var newsTypeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: newsTypeLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(NewsTypeViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let viewModel: HomeViewModel!
    
    private let menuHeader: MenuHeader = {
        let header = MenuHeader()
        return header
    }()
    
    private let popularTitle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Popular"
        text.font = .boldSystemFont(ofSize: 22)
        text.textColor = .black
        return text
    }()
    
    private lazy var verticleLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.95, height: 150)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var articleHorizontalSlider: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ArticleHorizontalSliderCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var articleVerticalSlider: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: verticleLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ArticleVerticleSliderCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        menuHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        articleHorizontalSlider.topAnchor.constraint(equalTo: menuHeader.bottomAnchor, constant: 32).isActive = true
        articleHorizontalSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        articleHorizontalSlider.trailingAnchor.constraint(equalTo: menuHeader.trailingAnchor).isActive = true
        articleHorizontalSlider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        popularTitle.topAnchor.constraint(equalTo: articleHorizontalSlider.bottomAnchor, constant: 20).isActive = true
        popularTitle.leadingAnchor.constraint(equalTo: articleHorizontalSlider.leadingAnchor, constant: 16).isActive = true
        popularTitle.trailingAnchor.constraint(equalTo: articleHorizontalSlider.trailingAnchor).isActive = true
        
        newsTypeCollectionView.topAnchor.constraint(equalTo: popularTitle.bottomAnchor, constant: 12).isActive = true
        newsTypeCollectionView.leadingAnchor.constraint(equalTo: popularTitle.leadingAnchor).isActive = true
        newsTypeCollectionView.trailingAnchor.constraint(equalTo: popularTitle.trailingAnchor).isActive = true
        newsTypeCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        articleVerticalSlider.topAnchor.constraint(equalTo: popularTitle.bottomAnchor, constant: 20).isActive = true
        articleVerticalSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        articleVerticalSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        articleVerticalSlider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(menuHeader)
        view.addSubview(articleHorizontalSlider)
        view.addSubview(popularTitle)
        view.addSubview(articleVerticalSlider)
        view.addSubview(newsTypeCollectionView)
        
        setConstraints()
        
        Network.shared.fetchNewsApi(url: .apple) { news in
            print(news)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == articleHorizontalSlider {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticleHorizontalSliderCell
            cell.configureArticle(title: "news.title", image: nil, source: "news.source?.name ")
            return cell
        } else if collectionView == articleVerticalSlider {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticleVerticleSliderCell
            cell.configureArticle(title: "Hello", image: nil, source: "OEs")
            cell.configureArticleSize(size: 18, bold: true)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsTypeViewCell
            if let type = viewModel.type(for: indexPath) {
                cell.configureNewsType(type: type)
            }
            return cell
        }
    }
}
