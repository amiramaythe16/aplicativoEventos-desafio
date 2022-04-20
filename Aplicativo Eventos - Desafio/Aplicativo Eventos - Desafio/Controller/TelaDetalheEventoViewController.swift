//
//  TelaDetalheEventoViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 19/04/22.
//

import UIKit

class TelaDetalheEventoViewController: UIViewController {

    var telaDetalheView = TelaDetalheEventoView()
    
    var idEvento: Int
    
    var presenter: EventosPresenter?
    
    var dadoEvento: BodyResponseEvento?
    
    init(idEvento: Int) {
        self.idEvento = idEvento
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaDetalheView
        self.configuraComponentes()
        self.presenter = EventosPresenter(output: self)
        self.presenter?.consultaEvendo(idEvento: self.idEvento)
    }
    
    func configuraComponentes(){
        self.telaDetalheView.tableView.delegate = self
        self.telaDetalheView.tableView.dataSource = self
        self.telaDetalheView.tableView.rowHeight = UITableView.automaticDimension
        self.telaDetalheView.tableView.register(CustomDescriptionTableViewCell.self, forCellReuseIdentifier: CustomDescriptionTableViewCell.identificador)
        
    }
    
    func configuraDadoEvento(dadoEvento: BodyResponseEvento){
        self.telaDetalheView.bind(detalheEvento: dadoEvento)
    }
}

extension TelaDetalheEventoViewController: ServiceEventoOutput {
    func retornaSucessoEvento(resposta: BodyResponseEvento) {
        self.dadoEvento = resposta
        self.configuraDadoEvento(dadoEvento: resposta)
        DispatchQueue.main.async {
            self.telaDetalheView.tableView.reloadData()
        }
    }
    
    func retornaSucessoEventos(resposta: [BodyResponseEvento]) {
       // self.dadosEvento = resposta
    }
}

extension TelaDetalheEventoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomDescriptionTableViewCell.identificador, for: indexPath) as? CustomDescriptionTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.bind(descricao: self.dadoEvento?.description ?? "--")
        return cell
    }
    
    
}
