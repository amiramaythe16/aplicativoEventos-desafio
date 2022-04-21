//
//  TelaCheckinView.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import UIKit

protocol TelaCheckinViewResponder {
    func botaoConfirmarPressionado()
}

class TelaCheckinView: UIView, CodableView {
    
    var responder: TelaCheckinViewResponder?
    
    var titulo: UILabel
    var descricao: UILabel
    var stackViewTitulo: UIStackView
    
    var labelTextFieldNome: UILabel
    var textFieldNome: UITextField
    var labelTextFieldEmail: UILabel
    var textFieldEmail: UITextField
    
    var botao: UIButton
    
    var populaDelegate: PopulaDadosCheckinProtocol?
    var nomeDigitado: String? {
        didSet {
            atualizaValores()
        }
    }
    
    var emailDigitado: String? {
        didSet {
            atualizaValores()
        }
    }
    
    override init(frame: CGRect) {
        self.titulo = UILabel()
        self.descricao = UILabel()
        self.stackViewTitulo = UIStackView(arrangedSubviews: [titulo, descricao])
        
        self.labelTextFieldNome = UILabel()
        self.textFieldNome = UITextField()
        self.labelTextFieldEmail = UILabel()
        self.textFieldEmail = UITextField()
        
        self.botao = UIButton()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        self.backgroundColor = .white
        
        self.titulo.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.bold)
        self.titulo.textColor = UIColor(hex: "005CA9")
        self.titulo.textAlignment = .left
        self.titulo.numberOfLines = .zero
        self.titulo.text = "Pronto pro check-in?"
        
        self.descricao.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        self.descricao.textColor = UIColor(hex: "3A4859")
        self.descricao.textAlignment = .left
        self.descricao.numberOfLines = .zero
        self.descricao.text = "Para começar, preencha os dados com seu nome e e-email."
        
        self.stackViewTitulo.distribution = .fillEqually
        self.stackViewTitulo.axis = .vertical
        self.stackViewTitulo.spacing = 8
        
        self.textFieldNome.placeholder = "Nome"
        self.textFieldNome.setLeftPaddingPoints(10.0)
        self.textFieldNome.setRightPaddingPoints(10.0)
        self.textFieldNome.layer.borderWidth = 1.0
        self.textFieldNome.layer.borderColor = UIColor(hex: "3A4859").cgColor
        self.textFieldNome.layer.cornerRadius = 8.0
        self.textFieldNome.delegate = self
    
        self.labelTextFieldNome.text = " Nome "
        self.labelTextFieldNome.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
        self.labelTextFieldNome.backgroundColor = .white
        
        self.textFieldEmail.placeholder = "E-mail"
        self.textFieldEmail.setLeftPaddingPoints(10.0)
        self.textFieldEmail.setRightPaddingPoints(10.0)
        self.textFieldEmail.layer.borderWidth = 1.0
        self.textFieldEmail.layer.borderColor = UIColor(hex: "3A4859").cgColor
        self.textFieldEmail.layer.cornerRadius = 8.0
        self.textFieldEmail.keyboardType = .emailAddress
        self.textFieldEmail.delegate = self
    
        self.labelTextFieldEmail.text = " E-mail "
        self.labelTextFieldEmail.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
        self.labelTextFieldEmail.backgroundColor = .white
        
        self.botao.setTitle("Confirmar", for: .normal)
        self.botao.backgroundColor = UIColor(hex: "005CA9")
        self.botao.layer.cornerRadius = 4.0
        self.botao.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        self.botao.addTarget(self, action: #selector(botaoConfirmarPressionado), for: .touchUpInside)
    }
    
    func buildViews() {
        self.addSubview(stackViewTitulo)
        self.addSubview(textFieldNome)
        self.addSubview(labelTextFieldNome)
        self.addSubview(textFieldEmail)
        self.addSubview(labelTextFieldEmail)
        self.addSubview(botao)
    }
    
    func setupConstraints() {
        self.stackViewTitulo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        self.textFieldNome.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewTitulo.snp.bottom).offset(30.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(60.0)
        }
        
        self.labelTextFieldNome.snp.makeConstraints { (make) in
            make.centerY.equalTo(textFieldNome.snp.top)
            make.leading.equalToSuperview().inset(32.0)
        }
        
        self.textFieldEmail.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldNome.snp.bottom).offset(20.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(60.0)
        }
        
        self.labelTextFieldEmail.snp.makeConstraints { (make) in
            make.centerY.equalTo(textFieldEmail.snp.top)
            make.leading.equalToSuperview().inset(32.0)
        }
        
        self.botao.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(24.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(40.0)
        }
    }
    
    fileprivate func atualizaValores() {
        populaDelegate?.populaNome(nome: nomeDigitado ?? "")
        populaDelegate?.populaEmial(email: emailDigitado ?? "")
    }
    
    @objc func botaoConfirmarPressionado(){
        responder?.botaoConfirmarPressionado()
    }
    
    func setBotaoProximoHabilitado(_ isHabilitado: Bool = true) {
        self.botao.alpha = isHabilitado ? 1 : 0.3
        self.botao.isEnabled = isHabilitado
    }

}

extension TelaCheckinView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let value = textFieldNome.text {
            let text = NSString(string: value).replacingCharacters(in: range, with: string)

            //se for espaço em branco já retorna false pois não é permitido
            if text == " " {
                return false
            } else {
                nomeDigitado = text
            }
        }

//        } else if let valueEmail = textFieldEmail.text {
//            let string = NSString(string: valueEmail).replacingCharacters(in: range, with: string)
//          //  if string == "" { valueEmail = String(valueEmail.dropLast()) }
//            //"\(valueEmail)\(string)".isValidEmail() ? setBotaoProximoHabilitado(true) : setBotaoProximoHabilitado(false)
//            emailDigitado = string
//        }
        return true
    }
}
