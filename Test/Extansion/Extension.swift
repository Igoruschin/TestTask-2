//
//  extension.swift
//  Test
//
//  Created by Игорь Ущин on 01.08.2022.
//

import UIKit

extension  UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard
                let httpURLResponce = responce  as? HTTPURLResponse, httpURLResponce.statusCode == 200,
                let mimeType = responce?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url,contentMode: mode)
    }
}
