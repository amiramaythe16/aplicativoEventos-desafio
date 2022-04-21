//
//  TelaCheckinViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import UIKit

protocol PopulaDadosCheckinProtocol {
    func populaNome(nome: String)
    func populaEmial(email: String)
}

class TelaCheckinViewController: UIViewController {

    var telaCheckin = TelaCheckinView()
    var idEvento: Int
    var presenter: EventosPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaCheckin
        self.telaCheckin.responder = self
        self.presenter = EventosPresenter(output: self)
    }
    
    init(idEvento: Int) {
        self.idEvento = idEvento
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TelaCheckinViewController: TelaCheckinViewResponder {
    func botaoConfirmarPressionado() {
        if let mail = self.telaCheckin.textFieldEmail.text,
            mail.isValidEmail(),
            let nome = self.telaCheckin.textFieldNome.text {
            self.presenter?.efetivaCheckin(idEvento: String(self.idEvento), nomeUsuario: nome, emailUsuario: mail)
        } else {
            let alertController = UIAlertController()
            let alert = UIAlertAction.init(title: "Digite um e-mail valido", style: .default)
            alertController.addAction(alert)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension TelaCheckinViewController: EventosPresenterOutput {
    func retornaSucessoCheckin() {
        DispatchQueue.main.async {
            let alertController = UIAlertController()
            let alert = UIAlertAction(title: "Check-in realizado com sucesso", style: .default, handler: {_ in
                self.navigationController?.popToRootViewController(animated: true)
            })
            alertController.addAction(alert)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
