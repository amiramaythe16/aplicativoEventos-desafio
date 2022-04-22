//
//  PresenterTests.swift
//  Aplicativo Eventos - DesafioTests
//
//  Created by cedesbr on 21/04/22.
//

import XCTest
@testable import Aplicativo_Eventos___Desafio

class PresenterTests: XCTestCase {
    private let mockOutput = EventosPresenterOutputMock()
    private let mockService = ServiceEventProtocolMock()
    private var sut: EventosPresenter!
    
    override func setUp() {
        self.sut = EventosPresenter(output: mockOutput)
        self.sut.servicoConsultaEventos = mockService
    }
    
    override func tearDown() {
        self.sut = nil
        self.mockService.clearMethods()
        self.mockOutput.clearMethods()
    }
    
    func test_ConsultaEventos_Successo() {
        self.sut.consultaEventos()
        XCTAssertEqual(self.mockOutput.didCallMethods, [.iniciaCarregamento])
        XCTAssertEqual(self.mockService.didCallMethods, [.getEventos])
    }
    
    func test_ConsultaEvento_Sucesso() {
        self.sut.consultaEvento(idEvento: 1)
        XCTAssertEqual(self.mockOutput.didCallMethods, [.iniciaCarregamento])
        XCTAssertEqual(self.mockService.didCallMethods, [.getEventoPassandoID])
    }
    
    func test_EfetivaCheckin_Sucesso() {
        self.sut.efetivaCheckin(idEvento: "1", nomeUsuario: "Amira", emailUsuario: "amira@gmail.com")
        XCTAssertEqual(self.mockOutput.didCallMethods, [.iniciaCarregamento])
        XCTAssertEqual(self.mockService.didCallMethods, [.postCheckin])
    }
}
