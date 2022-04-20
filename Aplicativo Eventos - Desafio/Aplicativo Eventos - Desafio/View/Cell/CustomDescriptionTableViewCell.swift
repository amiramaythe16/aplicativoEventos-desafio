//
//  CustomDescriptionTableViewCell.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import UIKit

class CustomDescriptionTableViewCell: UITableViewCell, CodableView {
    
    static let identificador = "CustomDescriptionTableViewCell"
    
    var descricao: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.descricao = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(descricao: String) {
        self.descricao.text = descricao
    }
        
    func setupComponents() {
        self.descricao.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.descricao.textColor = UIColor(hex: "3A4859")
        self.descricao.textAlignment = .left
        self.descricao.numberOfLines = 0
    
    }
    
    func buildViews() {
        self.addSubview(descricao)
    }
    
    func setupConstraints() {
        self.descricao.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().offset(8.0)
        }
        
    }
}
