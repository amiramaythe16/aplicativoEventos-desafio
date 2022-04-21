//
//  ServiceEvento.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation

protocol ServiceEventoOutput {
    func iniciaCarregamento(_ isLoading: Bool)
    func retornaSucessoEventos(resposta: [BodyResponseEvento])
    func retornaSucessoEvento(resposta: BodyResponseEvento)
    func retornaSucessoCheckin()
}

extension ServiceEventoOutput {
    func iniciaCarregamento(_ isLoading: Bool){}
    func retornaSucessoEventos(resposta: [BodyResponseEvento]){}
    func retornaSucessoEvento(resposta: BodyResponseEvento){}
    func retornaSucessoCheckin(){}
}

protocol ServiceEventProtocol {
    func getEventos()
    func getEvento(idEvento: Int)
    func postCheckin(body: BodyCheckinRequest)
    var delegate: ServiceEventoOutput? { get set }
}


class ServiceEvento: ServiceEventProtocol {
    
    var delegate: ServiceEventoOutput?
    
    func getEventos(){
        if let url = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events") {
            URLSession.shared.dataTask(with: url) { dados, response, error in
                guard let responseDados = dados else {return}
                
                do {
                    let resposta = try JSONDecoder().decode([BodyResponseEvento].self, from: responseDados)
                    self.delegate?.retornaSucessoEventos(resposta: resposta)
                } catch let error {
                    print(error.localizedDescription)
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
                    self.delegate?.retornaSucessoEvento(resposta: resposta)
                } catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
    
    func postCheckin(body: BodyCheckinRequest){
        if let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin") {
            
            var request = URLRequest(url: url)
           
            var params: [String: Any]?
            params = ["eventID" : body.eventID ?? "", "name" : body.name ?? "", "email": body.email ?? ""]
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: params ?? "", options: .prettyPrinted)
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { dados, response, error in
                guard let error = error else {
                    self.delegate?.retornaSucessoCheckin()
                    return
                }
                print(error.localizedDescription)
            }.resume()
        }
    }
}
