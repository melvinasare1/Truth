//
//  Extension.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import UIKit

extension Array {
    public func object(at index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}

extension UIImageView {
    public func setImage(image: String?) {
        if image != nil {
            print(image)
            self.sd_setImage(with: URL(string: image ?? "", relativeTo: nil))
            self.contentMode = .scaleAspectFill
        } else {
            self.image = UIImage(named: "no_image")   
            self.contentMode = .scaleAspectFit
        }
    }
}

extension UIView {
    convenience init(autoLayout: Bool = true) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = !autoLayout
    }
}
