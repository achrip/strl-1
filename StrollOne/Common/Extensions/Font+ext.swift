//
//  Font+ext.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 28/09/25.
//

import Foundation
import SwiftUI

extension Font {
    static func proximaNova(
        forTextStyle style: UIFont.TextStyle,
        weight: UIFont.Weight = .regular
    ) -> Self {
        UIFont.proximaNova(
            forTextStyle: style,
            weight: weight
        ).toFont()
    }
}
