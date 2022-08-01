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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var checkImageEnabled: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       return image
    }()
    
    var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        constraints()
        backgroundColor = .white
    }
    //MARK: - Setup Constraints
    private func setupViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(smallDescriptionLabel)
        addSubview(checkImageEnabled)
        addSubview(costLabel)
        
        stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                  smallDescriptionLabel,
                                                  costLabel])
    
           addSubview(stackView)
           stackView.axis = .vertical
           stackView.spacing = 1
           stackView.distribution = .equalSpacing
           stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.layer.cornerRadius = 9
        self.backgroundColor = #colorLiteral(red: 0.9725491405, green: 0.9725491405, blue: 0.9725491405, alpha: 1)
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
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            imageView.heightAnchor.constraint(equalToConstant: 52),
            imageView.widthAnchor.constraint(equalToConstant: 52)
        ])
        NSLayoutConstraint.activate([
            
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
        ])
        NSLayoutConstraint.activate([
            checkImageEnabled.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            checkImageEnabled.topAnchor.constraint(equalTo: topAnchor, constant: 30),
        ])
    }
}
