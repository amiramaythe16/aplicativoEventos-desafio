//
//  TelaPrincipalEventosModel.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation

struct BodyResponseEvento: Codable {
    var date: Int?
    var bodyResponseEventoDescription: String?
    var image: String?
    var longitude, latitude, price: Double?
    var title, id: String?

    enum CodingKeys: String, CodingKey {
        case date
        case bodyResponseEventoDescription = "description"
        case image, longitude, latitude, price, title, id
    }
}
