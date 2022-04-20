//
//  TelaDetalheEventoViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit

class TelaDetalheEventoViewController: UIViewController {

    var telaDetalheView = TelaDetalheEventoView()
    
    var idEvento: Int
    
    var presenter: EventosPresenter?
    
    init(idEvento: Int) {
        self.idEvento = idEvento
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaDetalheView
        self.presenter = EventosPresenter(output: self)
        self.presenter?.consultaEvendo(idEvento: self.idEvento)
    }
    
    func configuraDadoEvento(dadoEvento: BodyResponseEvento){
        self.telaDetalheView.bind(detalheEvento: dadoEvento)
    }
}

extension TelaDetalheEventoViewController: ServiceEventoOutput {
    func retornaSucessoEvento(resposta: BodyResponseEvento) {
        self.configuraDadoEvento(dadoEvento: resposta)
    }
    
    func retornaSucessoEventos(resposta: [BodyResponseEvento]) {
       // self.dadosEvento = resposta
    }
}
