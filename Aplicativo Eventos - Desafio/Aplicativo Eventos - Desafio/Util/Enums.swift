//
//  Enums.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 18/04/22.
//

import Foundation

public protocol CodableView: AnyObject {
    func setupComponents()
    func buildViews()
    func setupConstraints()
}

extension CodableView {
    func setupView() {
        setupComponents()
        buildViews()
        setupConstraints()
    }
}
