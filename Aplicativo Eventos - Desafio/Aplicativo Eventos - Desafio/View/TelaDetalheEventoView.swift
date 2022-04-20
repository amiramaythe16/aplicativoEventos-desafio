//
//  TelaDetalheEventoView.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit

class TelaDetalheEventoView: UIView, CodableView {
    
    var imagem: UIImageView
    
    var titulo: UILabel
    var labelPreco: UILabel
    var labelData: UILabel
    var stackViewDetalhe: UIStackView
    
    var botaoCheckin: UIButton
    var botaoCompartilhar: UIButton
    var stackViewBotoes: UIStackView
    
    var descricao: UILabel
    var botaoLerMais: UIButton
    
    fileprivate var descricaoExpandido: Bool = false
    
    fileprivate var quantidadeDeLinhas: Int {
        return self.descricao.numeroDeLinhas(width: UIScreen.main.bounds.width)
    }
    
    override init(frame: CGRect) {
        self.imagem = UIImageView()
        
        self.titulo = UILabel()
        self.labelPreco = UILabel()
        self.labelData = UILabel()
        self.stackViewDetalhe = UIStackView(arrangedSubviews: [titulo, labelPreco, labelData])
        
        self.botaoCheckin = UIButton()
        self.botaoCompartilhar = UIButton()
        self.stackViewBotoes = UIStackView(arrangedSubviews: [botaoCheckin, botaoCompartilhar])
        
        self.descricao = UILabel()
        self.botaoLerMais = UIButton()
        
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
            self.labelPreco.text = String(detalheEvento.price ?? .zero)
            
            let dataFormatada = Date(milliseconds: Int64(detalheEvento.date ?? .zero))
            self.labelData.text = dataFormatada.string(withFormat: "dd/MM/yyyy")
            self.descricao.text = detalheEvento.description
        }
    }

    
    func setupComponents() {
        self.backgroundColor = .white
        
        self.imagem.layer.cornerRadius = 50.0
        self.imagem.clipsToBounds = true
        self.imagem.contentMode = .scaleToFill
        
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
      //  self.botaoCheckin.addTarget(self, action: #selector(botao1Pressionado), for: .touchUpInside)
        
        self.botaoCompartilhar.setTitle("Compartilhar", for: .normal)
        self.botaoCompartilhar.backgroundColor = UIColor(hex: "005CA9")
        self.botaoCompartilhar.layer.cornerRadius = 4.0
        self.botaoCompartilhar.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        
        self.stackViewBotoes.distribution = .fillProportionally
        self.stackViewBotoes.axis = .horizontal
        self.stackViewBotoes.spacing = 8
        
        self.descricao.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.descricao.textColor = UIColor(hex: "3A4859")
        self.descricao.textAlignment = .left
        self.descricao.numberOfLines = 10
        
        self.botaoLerMais.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.regular)
        self.botaoLerMais.setTitle("Ler mais", for: .normal)
        self.botaoLerMais.setTitleColor(UIColor(hex: "005CA9"), for: .normal)
        self.botaoLerMais.backgroundColor = .white
        self.botaoLerMais.addTarget(self, action: #selector(clicouEmVerMais), for: .touchUpInside)
        self.botaoLerMais.isHidden = true
        
    
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.botaoLerMais.isHidden = !(quantidadeDeLinhas > 10)
    }
    
    func buildViews() {
        self.addSubview(imagem)
        self.addSubview(stackViewDetalhe)
        self.addSubview(stackViewBotoes)
        self.addSubview(descricao)
        self.addSubview(botaoLerMais)
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
            make.top.equalTo(stackViewDetalhe.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        self.descricao.snp.makeConstraints { make in
            make.top.equalTo(stackViewBotoes.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        self.botaoLerMais.snp.makeConstraints { make in
            make.top.equalTo(descricao.snp.bottom).offset(16.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.descricao.font.lineHeight)
        }
        
        self.botaoCheckin.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
        
        self.botaoCompartilhar.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
    }
    
    @objc func clicouEmVerMais() {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.descricao.numberOfLines = self?.descricaoExpandido ?? false ? 10 : 0
            self?.botaoLerMais.setTitle(self?.descricaoExpandido ?? false ? "Ler mais" : "Ler menos", for: .normal)
            self?.descricaoExpandido.toggle()
        }
    }
}
