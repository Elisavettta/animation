//
//  ViewController.swift
//  Lesson14
//
//  Created by Mac on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageView = UIImageView()
    private var grassImageView = UIImageView(image: .init(named: "grass"))
    var rainImage = [UIImageView]()
    var snow = [UIImageView]()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllViews()
        addSubviews()
        raining()
        snowfall()
        addDog()
        addDog()
    }
    
    //MARK: Grass
    
    private func setupAllViews() {
        setupImageView()
    }
    
    private func setupImageView() {
        grassImageView.frame = .init(
            origin: .init(x: view.frame.minX, y: view.frame.maxY - 100),
            size: .init(width: view.frame.width, height: 100) )
    }
    
    private func addSubviews() {
        view.addSubview(grassImageView)
    }
    
    // MARK: - Animation Dog
    
    private func addDog() {
        let height = Double.random(in: 100...120)
        let dogImageView = UIImageView()
        images = Dog.imageName.compactMap { name in
            UIImage(named: name)
        }
        dogImageView.frame = CGRect(
            x: -60,
            y: view.bounds.height - (height - 1),
            width: height / 1.5,
            height: height
        )
        dogImageView.animationImages = images
        dogImageView.animationDuration = 3
        dogImageView.startAnimating()
        
        UIView.animate(
            withDuration: Double.random(in: 10...20),
            delay: 0,
            options: .repeat,
            animations: {
                dogImageView.center.x += self.view.bounds.width + 140
            },
            completion: nil
        )
        view.addSubview(dogImageView)
    }
    
    //MARK: Animation Rain
    
    func raining() {
        (0...400).forEach { _ in
            let rainDropSize = CGFloat.random(in: 0.8...3)
            let rainDropImageView = UIImageView()
            rainDropImageView.frame = CGRect(
                x: .random(in: .zero...view.frame.width),
                y: .zero - view.frame.height * .random(in: 0.1...0.3),
                width: Drops.dropWidth * rainDropSize,
                height: Drops.dropHeigh * rainDropSize
            )
            rainDropImageView.image = UIImage(named: Drops.nameImageDrop)
            rainImage.append(rainDropImageView)
        }
        rainImage.forEach { each in
            UIView.animate(
                withDuration: .random(in: 2...5),
                delay: 0,
                options: .repeat,
                animations: { each.center.y = self.view.frame.height + 100 },
                completion: nil
            )
        }
        rainImage.forEach { view.addSubview($0) }
    }
    
    //MARK: Animation Snow
    
    func snowfall() {
        (0...100).forEach { _ in
            let snowDropSize = CGFloat.random(in: 0.8...3)
            let snowDropImageView = UIImageView()
            snowDropImageView.frame = CGRect(
                x: .random(in: .zero...view.frame.width),
                y: .zero - view.frame.height * .random(in: 0.1...0.3),
                width: Snowflake.snowflakeWidth * snowDropSize,
                height: Snowflake.snowflakeHeigh * snowDropSize
            )
            snowDropImageView.image = UIImage(named: Snowflake.nameImageSnowflakeWidth)
            rainImage.append(snowDropImageView)
        }
        rainImage.forEach { each in
            UIView.animate(
                withDuration: .random(in: 4...6),
                delay: 0,
                options: .repeat,
                animations: { each.center.y = self.view.frame.height + 100 },
                completion: nil
            )
        }
        rainImage.forEach { view.addSubview($0) }
    }
}
