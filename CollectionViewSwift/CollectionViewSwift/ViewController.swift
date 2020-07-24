//
//  ViewController.swift
//  CollectionViewSwift
//
//  Created by 邓乐 on 2020/7/24.
//  Copyright © 2020 lele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var section: Int = 1
    
    lazy var cv: UICollectionView = {
        let flowL = DFlowLayout()
        flowL.scrollDirection = .vertical
        flowL.minimumLineSpacing = 10
        flowL.minimumInteritemSpacing = 10
        flowL.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let screenSize = UIScreen.main.bounds.size
        flowL.itemSize = CGSize(width:(screenSize.width-10-10-10)*0.5, height: 50)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowL)
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.contentInsetAdjustmentBehavior = .never
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(DCollectionViewCell.self, forCellWithReuseIdentifier: "test")
        return cv
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect.zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .orange
        btn.setTitle("Click", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cv)
        let cvCons = [cv.leftAnchor.constraint(equalTo: view.leftAnchor),
                      cv.rightAnchor.constraint(equalTo: view.rightAnchor),
                      cv.topAnchor.constraint(equalTo: view.topAnchor),
                      cv.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(cvCons)
        
        view.addSubview(btn)
        let btnCons = [btn.heightAnchor.constraint(equalToConstant: 30),
                       btn.widthAnchor.constraint(equalToConstant: 100),
                       btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                       btn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)]
        NSLayoutConstraint.activate(btnCons)
        btn.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
    }
    
    @objc func clickBtn(_ sender: UIButton) {
        print("performBatchUpdates")
        section = 2
        cv.performBatchUpdates({
            cv.insertSections(IndexSet(arrayLiteral: 1))
        }) { (finish) in
            let ac = UIAlertController(title: "alert", message: "completed", preferredStyle: .alert)
            let actionok = UIAlertAction(title: "ok", style: .default, handler: nil)
            ac.addAction(actionok)
            self.present(ac, animated: true, completion: nil)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath) as! DCollectionViewCell
        cell.title.text = "section:\(indexPath.section), index:\(indexPath.item)"
        return cell
    }
}

