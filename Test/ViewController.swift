//
//  ViewController.swift
//  Test
//
//  Created by Игорь Ущин on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .white
        return collection
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Сделайте объявление заметнее на 7 дней"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var escapeButton: UIButton = {
         let button = UIButton(type: .system)
         button.tintColor = .black
         button.setImage(UIImage(systemName: "xmark"), for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    private lazy var enterButton: UIButton = {
         let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Выбрать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .medium)
        button.layer.cornerRadius = 7
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6769539118, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    var identifire = "cell"
    let networking = NetworkRequest()
    var results: ResultModel!
    var selectedCellIndex:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonRequest()
        setupView()
        view.backgroundColor = .white
    }
    //MARK: - Setup Constraints
    func setupView(){
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        view.addSubview(escapeButton)
        view.addSubview(enterButton)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseId)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
                                    ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
                                    ])
        
        NSLayoutConstraint.activate([
            escapeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            escapeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
                                    ])
        
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 400),
            enterButton.heightAnchor.constraint(equalToConstant: 60)
                                    ])
    }
    
    @objc func enterButtonTapped() {
        
        alertAccept(title: "Подписка оформлена", message: "Спасибо", prefferedSyle: .alert)
        
    }
    
    private func jsonRequest() {
             networking.jsonRequest { [weak self] result in
                  switch result {
                  case .success(let resultmodel):
                      self?.results = resultmodel
                      self?.collectionView.reloadData()
                  case .failure(let error):
                      print(error.localizedDescription)
                  }
              }
        }
}
//MARK: - Extension
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results?.result.list.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseId, for: indexPath) as! CollectionCell
        
        let results = results?.result.list[indexPath.row]
        cell.nameLabel.text = results?.title
        cell.costLabel.text = results?.price
        cell.smallDescriptionLabel.text = results?.listDescription
        let urlString = URL(string: (results?.icon.the52X52)!)
        cell.imageView.downloadedFrom(url: urlString!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
        if cell.isSelected == true {
            cell.isSelected = true
            cell.checkImageEnabled.image = UIImage(named: "checkmark.circle.fill")
        }else{
            cell.isSelected = false
            cell.checkImageEnabled.image =  UIImage(named: "")
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
        cell.checkImageEnabled.image = UIImage(named: "")

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 380, height: 220)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
}
