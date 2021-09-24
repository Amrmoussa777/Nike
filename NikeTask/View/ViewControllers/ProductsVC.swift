//
//  ViewController.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit

class ProductsVC: UIViewController{
    
    lazy var productsPresenter = ProductsPresenter(view: self)
    
     // collection View
    var productsCV:UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLayout()
    }

    private func configureLayout(){
        
        productsCV = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        productsCV.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellID)
        productsCV.register(ProductsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductsHeaderView.headerID)
        productsCV.delegate = self
        productsCV.dataSource  = self
        productsCV.translatesAutoresizingMaskIntoConstraints = false
        productsCV.backgroundColor = .systemBackground
        productsCV.showsVerticalScrollIndicator = false
        view.backgroundColor = .systemBackground
        view.addSubview(productsCV)
        productsCV.pinToSuperViewEdgesWithPadding(in: view, padding: .padding)
    }
    
    func showEMptyState(){
        let emptyState = EmptyStateView()
       view.addSubview(emptyState)
        NSLayoutConstraint.activate([
            emptyState.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyState.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyState.widthAnchor.constraint(equalTo: view.widthAnchor),
            emptyState.heightAnchor.constraint(equalTo: emptyState.widthAnchor),
        ])
    }
}


extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsPresenter.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsCV.dequeueReusableCell(withReuseIdentifier: ProductCell.cellID, for: indexPath) as! ProductCell
        cell.setProduct(product: productsPresenter.data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productsPresenter.productSelected(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width  = productsCV.frame.size.width
        return CGSize(width: width/2, height: width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductsHeaderView.headerID, for: indexPath) as! ProductsHeaderView
        sectionHeader.titleHeader.addbtton.addTarget(productsPresenter, action: #selector(productsPresenter.addProductPressed), for: .touchUpInside)
        sectionHeader.titleHeader.filterButton.addTarget(productsPresenter, action: #selector(productsPresenter.filterPressed), for: .touchUpInside)
        return sectionHeader

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size  = productsCV.frame.size
        return CGSize(width: size.width, height: 200)
    }
    
}
