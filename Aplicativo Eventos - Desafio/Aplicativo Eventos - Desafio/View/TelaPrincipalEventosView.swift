//
//  TelaPrincipalEventosView.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 18/04/22.
//

import Foundation
import UIKit
import SnapKit

class TelaPrincipalEventosView: UIView, CodableView {
    
    var label: UILabel
    
    override init(frame: CGRect) {
        self.label = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        self.backgroundColor = .yellow
        
        self.label.text = "Ola mundo!"
        self.label.textColor = .black
    }
    
    func buildViews() {
        self.addSubview(label)
    }
    
    func setupConstraints() {
        self.label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            
        }
    }
    
    
}
