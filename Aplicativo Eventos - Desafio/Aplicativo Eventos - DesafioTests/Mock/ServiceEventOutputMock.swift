//
//  ServiceEventOutputMock.swift
//  Aplicativo Eventos - DesafioTests
//
//  Created by cedesbr on 21/04/22.
//

@testable import Aplicativo_Eventos___Desafio

final class EventosPresenterOutputMock: EventosPresenterOutput {
    
    var didCallMethods: [Method] = []
    
    func clearMethods() {
        self.didCallMethods.removeAll()
    }
    
    func iniciaCarregamento(_ isLoading: Bool){
        self.didCallMethods.append(.iniciaCarregamento)
    }
    func retornaSucessoEventos(resposta: [BodyResponseEvento]){
        self.didCallMethods.append(.retornaSucessoEventos)
    }
    func retornaSucessoEvento(resposta: BodyResponseEvento){
        self.didCallMethods.append(.retornaSucessoEvento)
    }
    func retornaSucessoCheckin(){
        self.didCallMethods.append(.retornaSucessoCheckin)
    }
    
    enum Method {
        case iniciaCarregamento
        case retornaSucessoEventos
        case retornaSucessoEvento
        case retornaSucessoCheckin
    }
}
