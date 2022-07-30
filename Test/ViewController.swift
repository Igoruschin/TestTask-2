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
    
    var identifire = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.title = "Сделайте объявление заметнее на 7 дней"
        
       
        setupView()
        view.backgroundColor = .white
    }
    //MARK: - Setup Constraints
    func setupView(){
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseId)
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
                                    ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
                                    ])
        
    }
}
//MARK: - Extension
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseId, for: indexPath) as! CollectionCell
        
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: Const.galleryWidth, height: Const.galleryHeight)
       }
    
}
