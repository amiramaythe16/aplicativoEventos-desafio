//
//  Custom.swift
//  Aplicativo Eventos - Desafio
//
//  Created by cedesbr on 20/04/22.
//

import Foundation
import UIKit

extension UIImageView{
    
    public func loadImageUsingUrlString(urlString: String?) {
        let url = URL(string: urlString ?? "")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else {
                print(error?.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
