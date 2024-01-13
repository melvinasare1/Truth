//
//  Header.swift
//  Truth
//
//  Created by Melvin Asare on 07/01/2024.
//

import UIKit


class HeaderView: UICollectionReusableView {
    private let popularTitle: TruthLabel = {
       let label = TruthLabel()
        label.configureText(textAlignment: .left, titleText: "Popular")
        label.configureTitleSize(fontSize: 24, weight: .black)
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
          translatesAutoresizingMaskIntoConstraints = false
          addSubview(popularTitle)

          NSLayoutConstraint.activate([
            popularTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            popularTitle.topAnchor.constraint(equalTo: topAnchor),
            popularTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            popularTitle.heightAnchor.constraint(equalToConstant: 100)
          ])
        }
}
