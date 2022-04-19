//
//  TelaPrincipalEventosViewController.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 18/04/22.
//

import UIKit

class TelaPrincipalEventosViewController: UIViewController {

    var telaPrincialEventosView = TelaPrincipalEventosView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = telaPrincialEventosView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
