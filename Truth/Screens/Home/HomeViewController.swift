//
//  HomeViewController.swift
//  Truth
//
//  Created by Melvin Asare on 22/12/2023.
//

import UIKit
import Combine
import SDWebImage

class HomeViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    private let viewModel: HomeViewModel!
    
    private let menuHeader: MenuHeader = {
        let header = MenuHeader()
        return header
    }()
    
    func horizontalScroll() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.25)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 32, trailing: 0.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
    
    func newsTypeScroll() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.028)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
    
    func verticleScroll() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .estimated(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12)
        return section
    }
    
    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            print(section)
            if section == 0 {
                return self.horizontalScroll()
            } else if section == 1 {
                return self.newsTypeScroll()
            } else {
                return self.verticleScroll()
            }
        }
        return layout
    }
    
    private lazy var baseCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ArticleHorizontalSliderCell.self, forCellWithReuseIdentifier: "horizontalCell")
        collectionView.register(NewsTypeViewCell.self, forCellWithReuseIdentifier: "newsTypeCell")
        collectionView.register(ArticleVerticleSliderCell.self, forCellWithReuseIdentifier: "verticalCell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(kind)
        if kind == UICollectionView.elementKindSectionHeader && indexPath.item == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! HeaderView
            return headerView
        }

        return UICollectionReusableView()
    }

    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            menuHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            baseCollectionView.topAnchor.constraint(equalTo: menuHeader.bottomAnchor, constant: 32),
            baseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseCollectionView.heightAnchor.constraint(equalToConstant: 800)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.$techCrunchNews
            .sink { [weak self] news in
                DispatchQueue.main.async {
                    self!.baseCollectionView.reloadData()
                }
            }.store(in: &cancellables)
        
        view.addSubview(menuHeader)
        view.addSubview(baseCollectionView)
        
        setConstraints()
        
        baseCollectionView.reloadData()
        
        viewModel.fetchTechCrunchArticles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else if section == 1 {
            return 5
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        if indexPath.section == 0 {
            let article = viewModel.techCrunchNews?.articles[indexPath.row]
            print(article)
            let vm = NewsArticleViewModel(content: article?.content ?? "", image: article?.urlToImage?.absoluteString ?? "", authorName: article?.author ?? "", date: article?.publishedAt ?? "", url: (article?.url)!)
            
            let viewController = NewsArticleViewController(viewModel: vm)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCell", for: indexPath) as! ArticleHorizontalSliderCell
            if let news = viewModel.news(for: indexPath, articles: viewModel.techCrunchNews?.articles) {
                cell.configureArticle(title: news.title, image: news.urlToImage?.absoluteString, source: news.source?.name ?? "")
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsTypeCell", for: indexPath) as! NewsTypeViewCell
            cell.configureNewsType(type: "TYPE")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "verticalCell", for: indexPath) as! ArticleVerticleSliderCell
            cell.configureArticle(title: "news.title", image: nil, source: "news.source?.name ")
            return cell
        }
    }
}
