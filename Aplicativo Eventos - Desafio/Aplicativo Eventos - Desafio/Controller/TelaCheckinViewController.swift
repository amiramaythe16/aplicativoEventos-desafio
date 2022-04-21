//
//  TelaCheckinViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import UIKit

class TelaCheckinViewController: UIViewController {

    var telaCheckin = TelaCheckinView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaCheckin
        self.telaCheckin.setBotaoProximoHabilitado(false)
        self.telaCheckin.responder = self
    }

}

extension TelaCheckinViewController: TelaCheckinViewResponder {
    func botaoConfirmarPressionado() {
        
    }
}
