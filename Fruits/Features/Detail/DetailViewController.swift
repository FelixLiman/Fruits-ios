//
//  DetailViewController.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    
    private lazy var root = DetailView()
    
    private var disposable = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setupButton()
    }
    
    init(fruit: FruitModel?) {
        super.init(nibName: nil, bundle: nil)
        root.model = fruit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        root.backBtn.rx.tap.bind() { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposable)
    }
}
