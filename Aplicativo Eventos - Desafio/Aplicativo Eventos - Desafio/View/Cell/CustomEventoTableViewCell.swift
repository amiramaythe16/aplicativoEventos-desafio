//
//  CustomEventoTableViewCell.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit

class CustomEventoTableViewCell: UITableViewCell, CodableView {
    
    static let identificador = "CustomEventoTableViewCell"
    
    var containerView: UIView
    var viewLateral: UIView
    var iconeImagem: UIImageView
    
    var titulo: UILabel
    
    var labelEvento: UILabel
    var dataEvento: UILabel
    var stackDadosEvento: UIStackView
    
    var imgSetinha: UIImageView
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = UIView()
        self.viewLateral = UIView()
        self.iconeImagem = UIImageView()
        
        self.titulo = UILabel()
        
        self.labelEvento = UILabel()
        self.dataEvento = UILabel()
        self.stackDadosEvento = UIStackView(arrangedSubviews: [labelEvento, dataEvento])

        self.imgSetinha = UIImageView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(detalheEvento: BodyResponseEvento) {
        self.titulo.text = detalheEvento.title
        self.dataEvento.text = String(detalheEvento.date ?? .zero)
        
        self.setupView()
    }
    
    func setupComponents() {
        self.containerView.layer.cornerRadius = 8.0
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(hex: "EFF4F5").cgColor
        self.containerView.backgroundColor = UIColor(hex: "F9FBFB")
        self.containerView.layer.masksToBounds = true
        
        self.viewLateral.backgroundColor = UIColor(hex: "005CA9")
        
        self.iconeImagem.contentMode = .scaleAspectFit
        self.iconeImagem.image = UIImage(named: "calendario")
        
        self.titulo.textAlignment = .left
        self.titulo.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        self.titulo.numberOfLines = .zero
        self.titulo.textColor = UIColor(hex: "006480")
        
        self.labelEvento.textAlignment = .left
        self.labelEvento.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
        self.labelEvento.numberOfLines = .zero
        self.labelEvento.textColor = UIColor(hex: "006480")
        self.labelEvento.text = "Data do evento"
        
        self.dataEvento.textAlignment = .left
        self.dataEvento.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        self.dataEvento.numberOfLines = .zero
        self.dataEvento.textColor = UIColor(hex: "005CA9")
        
        self.stackDadosEvento.distribution = .fillEqually
        self.stackDadosEvento.axis = .horizontal
        self.stackDadosEvento.spacing = 104.0
    
        self.imgSetinha.contentMode = .scaleAspectFit
        self.imgSetinha.image = UIImage(named: "icone-setinha")
        
    }
    
    func buildViews() {
        addSubview(containerView)
        containerView.addSubview(viewLateral)
        containerView.addSubview(iconeImagem)
        containerView.addSubview(titulo)
        containerView.addSubview(stackDadosEvento)
        containerView.addSubview(imgSetinha)
    }
    
    func setupConstraints() {
        self.containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(80.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
        
        self.viewLateral.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(8.0)
        }
        
        self.iconeImagem.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18.0)
            make.leading.equalToSuperview().inset(16.0)
            make.height.width.equalTo(20.0)
        }
        
        self.titulo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12.0)
            make.leading.equalTo(iconeImagem.snp.trailing).offset(12.0)
            make.trailing.equalToSuperview().inset(40.0)
        }
        
        self.stackDadosEvento.snp.makeConstraints { make in
            make.top.equalTo(iconeImagem.snp.bottom).offset(16.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().inset(40.0)
            make.bottom.equalToSuperview().inset(4.0)
        }
        
        self.imgSetinha.snp.makeConstraints { (make) in
            make.height.width.equalTo(24.0)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12.0)
        }
    }
}
