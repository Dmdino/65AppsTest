//
//  ViewController.swift
//  65AppsTest
//
//  Created by Дмитрий Папушин on 21.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var images: [String] = []
    let baseLink = "http://placehold.it/375x150?text="
    
    fileprivate func genrateArrayOfLinks() {
        var num = 1
        var exemple = [0]
        
        for i in 0...98 {
            exemple.append(i)
        }
        
        var arr: [String] = []
        exemple.forEach { x in arr.append("\(baseLink)\(num)")
            num += 1
            images = arr
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        configureUI()
        genrateArrayOfLinks()
    }
    
    let tabelView = UITableView()
    
    func configureTableView() {
        view.addSubview(tabelView)
        
        tabelView.frame = view.bounds
        tabelView.rowHeight = 80
        tabelView.delegate = self
        tabelView.dataSource = self
        
        tabelView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        
    }
    
    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Boring images"
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as! CustomCell
        
        cell.setImage(url: images[indexPath.row])
        
        return cell
    }
    
    
}

