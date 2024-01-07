//
//  Header.swift
//  Truth
//
//  Created by Melvin Asare on 07/01/2024.
//

import UIKit


class HeaderView: UICollectionReusableView {
    
    private let popularTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "Popular"
        label.font = UIFont(name: "Arial", size: 24)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        constraints()
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          constraints()
      }

      private func constraints() {
          // Add your UILabel to the header view and set up constraints
          translatesAutoresizingMaskIntoConstraints = false
          addSubview(popularTitle)

          NSLayoutConstraint.activate([
            popularTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            popularTitle.topAnchor.constraint(equalTo: topAnchor),
            popularTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            popularTitle.heightAnchor.constraint(equalToConstant: 100)
          ])
          
          popularTitle.text = "Popular"
      }
}
