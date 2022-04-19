//
//  Extensions.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}

extension UILabel {
    func numeroDeLinhas(width: CGFloat) -> Int {
        guard let myText = self.text as NSString? else { return 0 }

        let rect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(
            with: rect, options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font ?? UIFont()], context: nil)

            return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
}
