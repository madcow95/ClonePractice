//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/01.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        
        // StoryBoard
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        // ViewController
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
