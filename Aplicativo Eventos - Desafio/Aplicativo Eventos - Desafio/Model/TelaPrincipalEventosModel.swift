//
//  TelaPrincipalEventosModel.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import Foundation

// MARK: - BodyResponseEvento

struct BodyResponseEvento: Codable {
    var date: Int?
    var description: String?
    var image: String?
    var longitude, latitude, price: Double?
    var title, id: String?

    enum CodingKeys: String, CodingKey {
        case date
        case description
        case image, longitude, latitude, price, title, id
    }
}

// MARK: - BodyCheckinRequest
struct BodyCheckinRequest: Codable {
    var eventID, name, email: String?

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case name, email
    }
}
