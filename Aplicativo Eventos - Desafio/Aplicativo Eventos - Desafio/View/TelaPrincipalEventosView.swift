//
//  TelaPrincipalEventosView.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit
import SnapKit

class TelaPrincipalEventosView: UIView, CodableView {
    
    var view: UIView
    
    var titulo: UILabel
    var descricao: UILabel
    var stackViewTitulo: UIStackView
    var tableView: UITableView
    
    override init(frame: CGRect) {
        self.view = UIView()
        self.titulo = UILabel()
        self.descricao = UILabel()
        self.stackViewTitulo = UIStackView(arrangedSubviews: [titulo, descricao])
        self.tableView = UITableView()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        self.backgroundColor = .white
        
        self.view.backgroundColor = UIColor(hex: "005CA9")
        
        self.titulo.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.bold)
        self.titulo.textColor = UIColor(hex: "005CA9")
        self.titulo.textAlignment = .left
        self.titulo.numberOfLines = .zero
        self.titulo.text = "Eventos"
        
        self.descricao.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.descricao.textColor = UIColor(hex: "3A4859")
        self.descricao.textAlignment = .left
        self.descricao.numberOfLines = .zero
        self.descricao.text = "Venha conferir os ultimos eventos!"
        
        self.stackViewTitulo.distribution = .fillProportionally
        self.stackViewTitulo.axis = .vertical
        self.stackViewTitulo.spacing = 8
        
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
    }
    
    func buildViews() {
        self.addSubview(view)
        self.addSubview(stackViewTitulo)
        self.addSubview(tableView)

    }
    
    func setupConstraints() {
        self.view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16.0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50.0)
        }
        
        self.stackViewTitulo.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewTitulo.snp.bottom).offset(24.0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(4.0)
        }
    }
    
    
}
