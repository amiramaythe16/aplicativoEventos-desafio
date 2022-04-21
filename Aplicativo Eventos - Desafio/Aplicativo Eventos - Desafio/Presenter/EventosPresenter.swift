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
        self.output?.iniciaCarregamento(true)
        self.servicoConsultaEventos?.getEventos()
    }
    
    func consultaEvento(idEvento: Int){
        self.output?.iniciaCarregamento(true)
        self.servicoConsultaEventos?.getEvento(idEvento: idEvento)
    }
    
    func efetivaCheckin(idEvento: String, nomeUsuario: String, emailUsuario: String){
        let body = BodyCheckinRequest(eventID: idEvento, name: nomeUsuario, email: emailUsuario)
        
        self.output?.iniciaCarregamento(true)
        self.servicoConsultaEventos?.postCheckin(body: body)
    }
    
}

extension EventosPresenter: ServiceEventoOutput {
    func retornaSucessoCheckin() {
        self.output?.iniciaCarregamento(false)
        self.output?.retornaSucessoCheckin()
    }
  
    func retornaSucessoEvento(resposta: BodyResponseEvento) {
        self.output?.iniciaCarregamento(false)
        self.output?.retornaSucessoEvento(resposta: resposta)
    }
    
    func retornaSucessoEventos(resposta: [BodyResponseEvento]) {
        self.output?.iniciaCarregamento(false)
        self.output?.retornaSucessoEventos(resposta: resposta)
    }
}
