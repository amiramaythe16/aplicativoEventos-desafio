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
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        self.backgroundColor = .white
        
        self.imagem.layer.borderWidth = 1.0
        self.imagem.layer.cornerRadius = 40.0
        self.imagem.contentMode = .scaleAspectFit
        self.imagem.backgroundColor = .blue
        
        self.titulo.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        self.titulo.textColor = UIColor(hex: "005CA9")
        self.titulo.textAlignment = .left
        self.titulo.numberOfLines = .zero
        self.titulo.text = "Doação de roupas"
        
        self.labelPreco.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.labelPreco.textColor = UIColor(hex: "008CB2")
        self.labelPreco.textAlignment = .left
        self.labelPreco.numberOfLines = .zero
        self.labelPreco.text = "R$ 29,99"
        
        self.labelData.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.labelData.textColor = UIColor(hex: "3A4859")
        self.labelData.textAlignment = .left
        self.labelData.numberOfLines = .zero
        self.labelData.text = "29/09/2010"
        
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
        self.descricao.numberOfLines = .zero
        self.descricao.text = "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade"
    
    }
    
    func buildViews() {
        self.addSubview(imagem)
        self.addSubview(stackViewDetalhe)
        self.addSubview(stackViewBotoes)
        self.addSubview(descricao)
    }
    
    func setupConstraints() {
        self.imagem.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80.0)
            make.leading.equalToSuperview().inset(16.0)
            make.width.height.equalTo(80.0)
        }
        
        self.stackViewDetalhe.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80.0)
            make.leading.equalTo(imagem.snp.trailing).offset(16.0)
        }
        
        self.stackViewBotoes.snp.makeConstraints { make in
            make.top.equalTo(stackViewDetalhe.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            
        }
        
        self.descricao.snp.makeConstraints { make in
            make.top.equalTo(stackViewBotoes.snp.bottom).inset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(8.0)
        }
        
        self.botaoCheckin.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
        
        self.botaoCompartilhar.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
    }
    


}
