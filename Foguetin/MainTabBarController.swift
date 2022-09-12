    //
    //  MainTabBarController.swift
    //  Foguetin
    //
    //  Created by aaav on 12/09/22.
    //

    import UIKit

    class MainTabBarController : UITabBarController{
        
        override func viewDidLoad() {
            
            let vcNave = UINavigationController(rootViewController: NaveViewController())
            let vcCreditos = UINavigationController(rootViewController: CreditosViewController())
            let vcBreguecos = UINavigationController(rootViewController: BreguecosViewController())

            vcNave.title = "Nave"
            vcCreditos.title = "Créditos"
            vcBreguecos.title = "Bregueços"
                
            self.setViewControllers([vcBreguecos, vcNave, vcCreditos], animated: false)

            self.tabBar.isTranslucent = false
            self.tabBar.unselectedItemTintColor = .black
            self.tabBar.tintColor = .white
            self.tabBar.backgroundColor = UIColor(red: 0.627, green: 0.145, blue: 0.173, alpha: 1.0)
            
            guard let items = self.tabBar.items else {
                return
            }
            for item in items {
                item.image = UIImage(systemName: "circle.fill")
            }
            
        }
        
    }
