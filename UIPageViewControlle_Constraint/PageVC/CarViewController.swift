//
//  CarViewController.swift
//  UIPageViewControlle_Constraint
//
//  Created by Леонид Шелудько on 10.01.2023.
//

import UIKit

class CarViewController: UIViewController {

    //MARK: - Image
    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true //все что выходит за границы слоя будет обрезано
        view.translatesAutoresizingMaskIntoConstraints = false  //тк как будут констрейенты это не нужно
        return view
    }()

    //MARK: - Lael
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView: [UIView] = [self.carImage, self.nameLabel]    //lazy в начале не заагружается
                                                                    //сработает когда мы к нему обратимся
    
    //MARK: - Init
    //код будет срабаатывать когда мы добвляем что то в КарсХелпер
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .purple
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        
        for view in subView {
            self.view.addSubview(view) //Тк subView - массив, пройдётся по всем элементам в структуре
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
