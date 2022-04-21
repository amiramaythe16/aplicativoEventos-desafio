//
//  ServiceEventProtocolMock.swift
//  Aplicativo Eventos - DesafioTests
//
//  Created by cedesbr on 21/04/22.
//

import Foundation
@testable import Aplicativo_Eventos___Desafio

final class ServiceEventProtocolMock: ServiceEventProtocol {
    
    var delegate: ServiceEventoOutput?
    var didCallMethods: [Method] = []
    
    func clearMethods() {
        self.didCallMethods.removeAll()
    }
    
    func getEventos() {
        self.didCallMethods.append(.getEventos)
    }
    
    func getEvento(idEvento: Int) {
        self.didCallMethods.append(.getEventoPassandoID)
    }
    
    func postCheckin(body: BodyCheckinRequest) {
        self.didCallMethods.append(.postCheckin)
    }
    
    enum Method {
        case getEventos
        case getEventoPassandoID
        case postCheckin
    }
}
