//
//  ViewController.swift
//  musial-app
//
//  Created by Danil Perednja on 27.12.2023.
//

import UIKit

class VideosVC: UIViewController, UITabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background color to white
        view.backgroundColor = .white

        // Create a UIScrollView
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        
        createCards(scrollView: scrollView)
        createTabBar()
        print("slay")
    }
    
    func createTabBar() {
        // Create a UITabBar
        let tabBar = UITabBar()
        tabBar.delegate = self

        // Create tab bar items
        let homeTabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 0)
        let artistTabBarItem = UITabBarItem(title: "Исполнители", image: UIImage(systemName: "square"), tag: 1)
        let coversTabBarItem = UITabBarItem(title: "Обложки", image: UIImage(systemName: "square"), tag: 2)
        let videoTabBarItem = UITabBarItem(title: "Видео", image: UIImage(systemName: "square"), tag: 3)
        let promoTabBarItem = UITabBarItem(title: "Промо", image: UIImage(systemName: "square"), tag: 4)

        // Add tab bar items to the tab bar
        tabBar.setItems([coversTabBarItem, artistTabBarItem, homeTabBarItem, videoTabBarItem, promoTabBarItem], animated: false)
        tabBar.setItems([coversTabBarItem, artistTabBarItem, homeTabBarItem, videoTabBarItem, promoTabBarItem], animated: false)
        tabBar.setItems([coversTabBarItem, artistTabBarItem, homeTabBarItem, videoTabBarItem, promoTabBarItem], animated: false)
        tabBar.setItems([coversTabBarItem, artistTabBarItem, homeTabBarItem, videoTabBarItem, promoTabBarItem], animated: false)

        // Add the tab bar to the view
        view.addSubview(tabBar)

        // Configure AutoLayout for the tab bar
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func createCards(scrollView: UIScrollView) {
        // Create preview cards
        let card1 = createPreviewCard(image: UIImage(named: "image1"), heading: "Card 1", description: "Description for Card 1.")
        let card2 = createPreviewCard(image: UIImage(named: "image2"), heading: "Card 2", description: "Description for Card 2.")
        let card3 = createPreviewCard(image: UIImage(named: "image3"), heading: "Card 3", description: "Description for Card 3.")
        let card4 = createPreviewCard(image: UIImage(named: "image4"), heading: "Card 4", description: "Description for Card 4.")

        // Add cards to the scroll view
        scrollView.addSubview(card1)
        scrollView.addSubview(card2)
        scrollView.addSubview(card3)
        scrollView.addSubview(card4)

        // Add the scroll view to the view
        view.addSubview(scrollView)

        // Configure AutoLayout for the scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // Configure AutoLayout for the cards
        NSLayoutConstraint.activate([
            card1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            card1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            card1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            

            card2.topAnchor.constraint(equalTo: card1.bottomAnchor, constant: 16),
            card2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            card2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            card3.topAnchor.constraint(equalTo: card2.bottomAnchor, constant: 16),
            card3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            card3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            card4.topAnchor.constraint(equalTo: card3.bottomAnchor, constant: 16),
            card4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            card4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            card4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }

    // UITabBarDelegate method to handle tab selection
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Handle tab selection based on the item's tag or any custom logic
        switch item.tag {
        case 0:
            print("Home tab selected")
        case 1:
            print("Settings tab selected")
        default:
            break
        }
    }

    // Function to create a preview card
    func createPreviewCard(image: UIImage?, heading: String, description: String) -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = .lightGray
        cardView.layer.cornerRadius = 8
        cardView.clipsToBounds = true

        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        let headingLabel = UILabel()
        headingLabel.text = heading
        headingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headingLabel.textColor = .black

        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 2

        // Add subviews to the card view
        cardView.addSubview(imageView)
        cardView.addSubview(headingLabel)
        cardView.addSubview(descriptionLabel)

        // Configure AutoLayout for the card view
        cardView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),

            headingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            headingLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),

            descriptionLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
        ])

        return cardView
    }
}

