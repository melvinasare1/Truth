//
//  ArrayExtension.swift
//  Truth
//
//  Created by Melvin Asare on 31/12/2023.
//

import Foundation

extension Array {
    func object(at index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}
