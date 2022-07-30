//
//  CollectionCell.swift
//  Test
//
//  Created by Игорь Ущин on 29.07.2022.
//

import UIKit


class CollectionCell: UICollectionViewCell {
    
    static let reuseId = "Cell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        label.text = "Сделайте объявление заметнее на 7 дней"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.setImage(UIImage(systemName: "suit.heart.fill"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressLikeButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1353955865, green: 0.1372428834, blue: 0.3925223947, alpha: 1)
        button.setTitle("В Корзину", for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressInBasket(sender:)), for: .touchUpInside)
        return button
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(smallDescriptionLabel)
        addSubview(likeButton)
        addSubview(costLabel)
        addSubview(buyButton)
        
        constraints()
        backgroundColor = .white
    }
    
    @objc func pressLikeButton(_ sender: UIButton){}
    
    @objc func pressInBasket(sender: Any){}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 9
        self.layer.shadowRadius = 5
        self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 3)
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SetConstraints
extension CollectionCell {
    
    func constraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9),
            imageView.widthAnchor.constraint(equalToConstant: 50/2),
            //imageView.heightAnchor.constraint(equalToConstant: 50/2)
        ])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            smallDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            smallDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
           // smallDescriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10),
        ])
        NSLayoutConstraint.activate([
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 40),
            likeButton.widthAnchor.constraint(equalToConstant: 45),
            likeButton.heightAnchor.constraint(equalToConstant: 45),
        ])
        NSLayoutConstraint.activate([
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            buyButton.topAnchor.constraint(equalTo: smallDescriptionLabel.bottomAnchor, constant: 23),
            buyButton.widthAnchor.constraint(equalToConstant: 90),
            buyButton.heightAnchor.constraint(equalToConstant: 33),
        ])
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            costLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}
