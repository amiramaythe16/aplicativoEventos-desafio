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
    var presenter: EventosPresenterProtocol?
    var dadoEvento: BodyResponseEvento?
    
    let formatadorMoeda: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
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
        self.presenter?.consultaEvento(idEvento: self.idEvento)
    }
    
    func configuraComponentes(){
        self.telaDetalheView.responder = self
        self.telaDetalheView.tableView.delegate = self
        self.telaDetalheView.tableView.dataSource = self
        self.telaDetalheView.tableView.rowHeight = UITableView.automaticDimension
        self.telaDetalheView.tableView.register(CustomDescriptionTableViewCell.self, forCellReuseIdentifier: CustomDescriptionTableViewCell.identificador)
        
    }
    
    func configuraDadoEvento(dadoEvento: BodyResponseEvento){
        self.telaDetalheView.bind(detalheEvento: dadoEvento)
    }
}

extension TelaDetalheEventoViewController: EventosPresenterOutput {
    func retornaSucessoEvento(resposta: BodyResponseEvento) {
        self.dadoEvento = resposta
        self.configuraDadoEvento(dadoEvento: resposta)
        DispatchQueue.main.async {
            self.telaDetalheView.tableView.reloadData()
        }
    }
    
    func iniciaCarregamento(_ isLoading: Bool) {
        self.telaDetalheView.iniciaCarregamento(isLoading)
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

extension TelaDetalheEventoViewController: TelaDetalheEventoViewResponder {
    func botaoCheckinPressionado() {
        let navigation = TelaCheckinViewController(idEvento: self.idEvento)
        navigationItem.backButtonTitle = "Voltar"
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func botaoCompartilharPressionado() {

        guard let tituloEvento = self.dadoEvento?.title,
              let descricaoEvento = self.dadoEvento?.description,
              let dataEvento = self.dadoEvento?.date,
              let precoEvento = self.dadoEvento?.price else {return}
        
        let dataFormatada = Date(milliseconds: Int64(dataEvento))
        let data = dataFormatada.string(withFormat: "dd/MM/yyyy")
        
        let preco = self.formatadorMoeda.string(from: NSNumber(value: precoEvento))
    
        let text = "\(tituloEvento)\n\nData do evento: \(data)\nPreço do evento: \(preco ?? "--")\n\n\(descricaoEvento)"
        
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
