//
//  TelaPrincipalEventosViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 18/04/22.
//

import UIKit

class TelaPrincipalEventosViewController: UIViewController {

    var telaPrincialEventosView = TelaPrincipalEventosView()
    
    var dadosEvento = [DetalheEvento]()
    
    var dadoDoEvento = [DetalheEvento(tituloEvento: "Feira de adoção de animais na Redenção", labelData: "12/01/2022"),
                        DetalheEvento(tituloEvento: "Doação de roupas", labelData: "12/01/2022"),
                        DetalheEvento(tituloEvento: "Feira de Troca de Livros", labelData: "12/01/2022") ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaPrincialEventosView
        self.configuraComponentes()
        self.dadosEvento.append(contentsOf: self.dadoDoEvento)
    }
    
    func configuraComponentes(){
        self.telaPrincialEventosView.tableView.delegate = self
        self.telaPrincialEventosView.tableView.dataSource = self
        self.telaPrincialEventosView.tableView.rowHeight = UITableView.automaticDimension
        self.telaPrincialEventosView.tableView.register(CustomEventoTableViewCell.self, forCellReuseIdentifier: CustomEventoTableViewCell.identificador)
        
    }
}

extension TelaPrincipalEventosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosEvento.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomEventoTableViewCell.identificador, for: indexPath) as? CustomEventoTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.bind(detalheEvento: dadosEvento[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = TelaDetalheEventoViewController()
        navigationItem.backButtonTitle = "Voltar"
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.pushViewController(navigation, animated: true)
    }
}
