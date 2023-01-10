//
//  MyViewController.swift
//  UIPageViewControlle_Constraint
//
//  Created by Леонид Шелудько on 10.01.2023.
//

import UIKit

class MyViewController: UIPageViewController {
    
    //MARK: - Variable
    var cars = [CarsHelper]()
    let range = UIImage(named: "range")
    let rover = UIImage(named: "rover")

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cars"
        
        let firstCar = CarsHelper(name: "Car - Range", image: range!)
        let lastCar = CarsHelper(name: "Car - Rover", image: rover!)
        cars.append(firstCar)
        cars.append(lastCar)
    }
    
    //MARK: - create vc
    lazy var arrayCarViewController: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()

    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        self.view.backgroundColor = .green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    //viewControllerBefore - показывает когда идем вперед
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayCarViewController[index - 1]
            }
        }
        
        return nil
    }
    
    //viewControllerAfter - показывает когда идем назад
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
        }
        
        return nil
    }
    
    
    //Показавыает на какой страничке из скольки
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
