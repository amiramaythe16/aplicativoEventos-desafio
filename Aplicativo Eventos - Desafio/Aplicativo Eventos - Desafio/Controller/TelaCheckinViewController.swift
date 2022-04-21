//
//  TelaCheckinViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import UIKit

protocol PopulaDadosCheckinProtocol {
    func populaNome(nome: String)
    func populaEmial(email: String)
}

class TelaCheckinViewController: UIViewController {

    var telaCheckin = TelaCheckinView()
    
    var idEvento: Int
    var nome: String?
    var email: String?
    
    var presenter: EventosPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaCheckin
     //   self.telaCheckin.setBotaoProximoHabilitado(false)
        self.telaCheckin.responder = self
        self.presenter = EventosPresenter(output: self)
        self.telaCheckin.populaDelegate = self
    }
    
    init(idEvento: Int) {
        self.idEvento = idEvento
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TelaCheckinViewController: TelaCheckinViewResponder {
    func botaoConfirmarPressionado() {
        self.presenter?.efetivaCheckin(idEvento: String(self.idEvento), nomeUsuario: self.nome ?? "", emailUsuario: "amira@gmail.com")
    }
}

extension TelaCheckinViewController: ServiceEventoOutput {
    func retornaSucessoCheckin() {
        print("foi")
    }
}

extension TelaCheckinViewController: PopulaDadosCheckinProtocol {
    func populaNome(nome: String) {
        self.nome = nome
    }
    
    func populaEmial(email: String) {
        self.email = email
    }
    
}
