//
//  ServiceEvento.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation

protocol ServiceEventoOutput {
    func retornaSucessoEventos(resposta: [BodyResponseEvento])
    func retornaSucessoEvento(resposta: BodyResponseEvento)
    func retornaSucessoCheckin(resposta: BodyCheckinRequest)
}

extension ServiceEventoOutput {
    func retornaSucessoEventos(resposta: [BodyResponseEvento]){}
    func retornaSucessoEvento(resposta: BodyResponseEvento){}
    func retornaSucessoCheckin(resposta: BodyCheckinRequest){}
}


class ServiceEvento {
    
    var output: ServiceEventoOutput
    
    init(output: ServiceEventoOutput) {
        self.output = output
    }
    
    func getEventos(){
        if let url = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events") {
            URLSession.shared.dataTask(with: url) { dados, response, error in
                guard let responseDados = dados else {return}
                
                do {
                    let resposta = try JSONDecoder().decode([BodyResponseEvento].self, from: responseDados)
                    self.output.retornaSucessoEventos(resposta: resposta)
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    }
    
    func getEvento(idEvento: Int){
        if let url = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events/\(idEvento)") {
            URLSession.shared.dataTask(with: url) { dados, response, error in
                guard let responseDados = dados else {return}
                
                do {
                    let resposta = try JSONDecoder().decode(BodyResponseEvento.self, from: responseDados)
                    self.output.retornaSucessoEvento(resposta: resposta)
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    }
    
    func postCheckin(){
        if let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin") {
            URLSession.shared.dataTask(with: url) { dados, response, error in
                guard let responseDados = dados else {return}
                
                do {
                    let resposta = try JSONDecoder().decode(BodyCheckinRequest.self, from: responseDados)
                    self.output.retornaSucessoCheckin(resposta: resposta)
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    }
}
