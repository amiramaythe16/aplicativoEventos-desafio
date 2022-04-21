//
//  TelaDetalheEventoView.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit

protocol TelaDetalheEventoViewResponder {
    func botaoCheckinPressionado()
    func botaoCompartilharPressionado()
}

class TelaDetalheEventoView: UIView, CodableView {
    
    var responder: TelaDetalheEventoViewResponder?
    
    var imagem: UIImageView
    
    var loading: UIActivityIndicatorView
    
    var titulo: UILabel
    var labelPreco: UILabel
    var labelData: UILabel
    var stackViewDetalhe: UIStackView
    
    var botaoCheckin: UIButton
    var botaoCompartilhar: UIButton
    var stackViewBotoes: UIStackView
    
    var tableView: UITableView

    let formatadorMoeda: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    override init(frame: CGRect) {
        self.imagem = UIImageView()
        
        self.titulo = UILabel()
        self.labelPreco = UILabel()
        self.labelData = UILabel()
        self.stackViewDetalhe = UIStackView(arrangedSubviews: [titulo, labelPreco, labelData])
        
        self.botaoCheckin = UIButton()
        self.botaoCompartilhar = UIButton()
        self.stackViewBotoes = UIStackView(arrangedSubviews: [botaoCheckin, botaoCompartilhar])
        
        self.tableView = UITableView()
        self.loading = UIActivityIndicatorView()
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(detalheEvento: BodyResponseEvento) {
        DispatchQueue.main.async {
            self.imagem.loadImageUsingUrlString(urlString: detalheEvento.image)
            self.titulo.text = detalheEvento.title
            self.labelPreco.text = self.formatadorMoeda.string(from: NSNumber(value: detalheEvento.price ?? .zero))
    
            let dataFormatada = Date(milliseconds: Int64(detalheEvento.date ?? .zero))
            self.labelData.text = dataFormatada.string(withFormat: "dd/MM/yyyy")
        }
    }

    
    func setupComponents() {
        self.backgroundColor = .white
        
        self.imagem.layer.cornerRadius = 50.0
        self.imagem.clipsToBounds = true
        self.imagem.contentMode = .scaleToFill
        self.imagem.backgroundColor = UIColor(hex: "005CA9")
        
        self.titulo.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        self.titulo.textColor = UIColor(hex: "005CA9")
        self.titulo.textAlignment = .left
        self.titulo.numberOfLines = .zero

        self.labelPreco.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.labelPreco.textColor = UIColor(hex: "008CB2")
        self.labelPreco.textAlignment = .left
        self.labelPreco.numberOfLines = .zero
        
        self.labelData.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.labelData.textColor = UIColor(hex: "3A4859")
        self.labelData.textAlignment = .left
        self.labelData.numberOfLines = .zero
        
        self.stackViewDetalhe.distribution = .fillProportionally
        self.stackViewDetalhe.axis = .vertical
        self.stackViewDetalhe.spacing = 8
        
        self.botaoCheckin.setTitle("Check-in", for: .normal)
        self.botaoCheckin.setTitleColor(UIColor(hex: "005CA9"), for: .normal)
        self.botaoCheckin.layer.cornerRadius = 4.0
        self.botaoCheckin.layer.borderWidth = 1.0
        self.botaoCheckin.layer.borderColor = UIColor(hex: "005CA9").cgColor
        self.botaoCheckin.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        self.botaoCheckin.addTarget(self, action: #selector(botaoCheckinPressionado), for: .touchUpInside)
        
        self.botaoCompartilhar.setTitle("Compartilhar", for: .normal)
        self.botaoCompartilhar.backgroundColor = UIColor(hex: "005CA9")
        self.botaoCompartilhar.layer.cornerRadius = 4.0
        self.botaoCompartilhar.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        self.botaoCompartilhar.addTarget(self, action: #selector(botaoCompartilharPressionado), for: .touchUpInside)
        
        self.stackViewBotoes.distribution = .fillProportionally
        self.stackViewBotoes.axis = .horizontal
        self.stackViewBotoes.spacing = 8
        
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        
        self.loading.style = .large
        self.loading.backgroundColor = .white

    }
    
    
    func buildViews() {
        self.addSubview(imagem)
        self.addSubview(stackViewDetalhe)
        self.addSubview(stackViewBotoes)
        self.addSubview(tableView)
        self.addSubview(loading)
    }
    
    func setupConstraints() {
        self.imagem.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80.0)
            make.leading.equalToSuperview().inset(16.0)
            make.width.height.equalTo(100.0)
        }
        
        self.stackViewDetalhe.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80.0)
            make.leading.equalTo(imagem.snp.trailing).offset(16.0)
            make.trailing.equalToSuperview().inset(16.0)
        }
        
        self.stackViewBotoes.snp.makeConstraints { make in
            make.top.equalTo(imagem.snp.bottom).offset(24.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(stackViewBotoes.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(8.0)
        }
        
        self.loading.snp.makeConstraints { make in
            make.height.width.equalTo(100.0)
            make.centerX.centerY.equalToSuperview()
        }
        
        self.botaoCheckin.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
        
        self.botaoCompartilhar.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
    }
    
    @objc func botaoCheckinPressionado(){
        responder?.botaoCheckinPressionado()
    }
    
    @objc func botaoCompartilharPressionado(){
        responder?.botaoCompartilharPressionado()
    }
    
    func iniciaCarregamento(_ isLoading: Bool) {
        isLoading ? showLoading() : hideLoading()
    }
    
    func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }

}
