//
//  UIFont+ext.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 28/09/25.
//

import Foundation
import SwiftUI
import UIKit

extension UIFont {
    private static let customBaseSizes: [UIFont.TextStyle: CGFloat] = [
        .largeTitle: 34,
        .title1: 28,
        .title2: 22,
        .title3: 18,
        .headline: 16,
        .body: 16,
        .callout: 15,
        .subheadline: 14,
        .footnote: 12,
        .caption1: 10,
        .caption2: 9
    ]
    
    static func proximaNova(
        forTextStyle style: UIFont.TextStyle,
        weight: UIFont.Weight = .regular
    ) -> UIFont {
        let basePointSize = customBaseSizes[style] ?? UIFont.preferredFont(forTextStyle: style).pointSize
        
        let fontName: String = {
            switch weight {
            case .thin, .light:
                return "ProximaNova-ThinIt"
            case .regular:
                return "ProximaNova-Regular"
            case .semibold:
                return "ProximaNova-Semibold"
            case .bold:
                return "ProximaNova-Bold"
            case .heavy:
                return "ProximaNova-Extrabold"
            case .black:
                return "ProximaNova-Black"
            default:
                return "ProximaNova-Regular"
            }
        }()
        
        guard let customFont = UIFont(name: fontName, size: basePointSize) else {
            assertionFailure("❌ Failed to load custom font: \(fontName) check your .ttf file or info.plist registration")
            return UIFont.preferredFont(forTextStyle: style)
        }
        
        return UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)
    }
    
    func toFont() -> Font {
        Font(self)
    }
}
