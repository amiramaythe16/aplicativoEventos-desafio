//
//  EventosPresenter.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation
import UIKit

class EventosPresenter: NSObject {
    var servicoConsultaEventos: ServiceEvento?
    var output: ServiceEventoOutput?
    
    init(output: ServiceEventoOutput) {
        super.init()
        self.output = output
        self.servicoConsultaEventos = ServiceEvento(output: self)
    }

    func consultaEventos(){
        self.servicoConsultaEventos?.getEventos()
    }
    
    func consultaEvendo(idEvento: Int){
        self.servicoConsultaEventos?.getEvento(idEvento: idEvento)
    } 
    
}

extension EventosPresenter: ServiceEventoOutput {
    
    func retornaSucessoEvento(resposta: BodyResponseEvento) {
        self.output?.retornaSucessoEvento(resposta: resposta)
    }
    
    func retornaSucessoEventos(resposta: [BodyResponseEvento]) {
        self.output?.retornaSucessoEventos(resposta: resposta)
    }
}
