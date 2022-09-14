//
//  NaveViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class NaveViewController : UIViewController {

    private let solarSystemTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        view.addSubview(solarSystemTable)

        solarSystemTable.delegate = self
        solarSystemTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        solarSystemTable.frame = view.bounds
        solarSystemTable.backgroundColor = UIColor(red: 0.3, green: 0, blue: 0, alpha: 0)
    }

}

extension NaveViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}



// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Nave: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            NaveViewController().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
