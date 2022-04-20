//
//  EventosPresenter.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation

class EventosPresenter: NSObject {
    var servicoConsultaEventos: ServiceEvento?
    var output: ServiceEventoOutput?
    
    init(output: ServiceEventoOutput) {
        super.init()
        self.output = output
        self.servicoConsultaEventos = ServiceEvento(output: self)
    }

    func consultaEvento(){
        self.servicoConsultaEventos?.getEventos()
    }
}

extension EventosPresenter: ServiceEventoOutput {
    func retornaSucessoEvento(resposta: [BodyResponseEvento]) {
        self.output?.retornaSucessoEvento(resposta: resposta)
    }
}
