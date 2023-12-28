//
//  ViewController.swift
//  musial-app
//
//  Created by Danil Perednja on 27.12.2023.
//

import UIKit

class HomeVC: UIViewController, UITabBarDelegate {
    
    var mainScroll: UIScrollView? = nil
    var tabBar: UITabBar? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color to white
        view.backgroundColor = UIColor(named: "#121214")
        
        // Create a UIScrollView
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .black
        scrollView.isScrollEnabled = true
        
        self.mainScroll = scrollView
        createTabBar()
        configureUI(scrollView: scrollView)
    }
    
    
    func createTabBar() {
        // Create a UITabBar
        let tabBar = UITabBar()
        tabBar.delegate = self
        tabBar.barTintColor = UIColor.darkGray
        self.tabBar = tabBar
        
        // Create tab bar items
        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "logo-white")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 0)
        let artistTabBarItem = UITabBarItem(title: "Исполнители", image: UIImage(systemName: "person.3"), tag: 1)
        let coversTabBarItem = UITabBarItem(title: "Обложки", image: UIImage(systemName: "square"), tag: 2)
        let videoTabBarItem = UITabBarItem(title: "Видео", image: UIImage(systemName: "play"), tag: 3)
        let promoTabBarItem = UITabBarItem(title: "Промо", image: UIImage(systemName: "star"), tag: 4)
        
        homeTabBarItem.imageInsets = UIEdgeInsets(top: 5, left: -10, bottom: -15, right: -10)
        coversTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        artistTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        videoTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        promoTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
        // Add tab bar items to the tab bar
        tabBar.setItems([artistTabBarItem, coversTabBarItem, homeTabBarItem, videoTabBarItem, promoTabBarItem], animated: false)
        
        // Add the tab bar to the view
        view.addSubview(tabBar)
        
        // Configure AutoLayout for the tab bar
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureUI(scrollView: UIScrollView) {
//        let main = createPreviewCard(image: UIImage(named: "image1"), heading: "Название обложки", description: "Description for Card 1.")
        
        // Create a banner
        let banner = UIImageView()
        banner.image = UIImage(named: "M_MainBanner")
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.contentMode = .scaleAspectFill
        banner.clipsToBounds = true
        banner.layer.cornerRadius = 8
        
        
        // Create a UIStackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Best videos section
        // Configure section heading
        let bestVideoHeading = UILabel()
        bestVideoHeading.text = "Лучшие видеоклипы"
        bestVideoHeading.font = UIFont.boldSystemFont(ofSize: 24)
        bestVideoHeading.textColor = .white
        bestVideoHeading.translatesAutoresizingMaskIntoConstraints = false
        bestVideoHeading.textAlignment = .center
        
        let bestVideoImage = UIImageView()
        bestVideoImage.image = UIImage(named: "M_VideoCard")
        bestVideoImage.translatesAutoresizingMaskIntoConstraints = false
        bestVideoImage.contentMode = .scaleAspectFill
        bestVideoImage.clipsToBounds = true
        bestVideoImage.layer.cornerRadius = 8
        
        // Covers section
        let bestCoversImage = UIImageView()
        bestCoversImage.image = UIImage(named: "M_Banner")
        bestCoversImage.translatesAutoresizingMaskIntoConstraints = false
        bestCoversImage.contentMode = .scaleAspectFill
        bestCoversImage.clipsToBounds = true
        bestCoversImage.layer.cornerRadius = 8
        
        // Interview section
        let interviewImage = UIImageView()
        interviewImage.image = UIImage(named: "M_BannerLong")
        interviewImage.translatesAutoresizingMaskIntoConstraints = false
        interviewImage.contentMode = .scaleAspectFill
        interviewImage.clipsToBounds = true


        
        // Add cards to the scroll view
        stackView.addArrangedSubview(banner)
        stackView.addArrangedSubview(bestVideoHeading)
        stackView.addArrangedSubview(bestVideoImage)
        stackView.addArrangedSubview(bestCoversImage)
        stackView.addArrangedSubview(interviewImage)
        
        // Add the scroll view to the view
        view.addSubview(scrollView)
        
        // Configure AutoLayout for the scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.tabBar!.topAnchor).isActive = true
        
        // Configure AutoLayout for the cards
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            banner.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            banner.heightAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            bestVideoHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            bestVideoHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bestVideoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bestVideoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bestVideoImage.heightAnchor.constraint(equalToConstant: 260),
            
            bestCoversImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            bestCoversImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bestCoversImage.heightAnchor.constraint(equalToConstant: 300),
            
            interviewImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            interviewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            interviewImage.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    // UITabBarDelegate method to handle tab selection
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Handle tab selection based on the item's tag or any custom logic
        switch item.tag {
        case 0:
            print("Home tab selected")
            let viewController = HomeVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            print("Artists tab selected")
            let viewController = ArtistsVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            print("Covers tab selected")
            let viewController = CoversVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 3:
            print("Videos tab selected")
            let viewController = VideosVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 4:
            print("Promos tab selected")
            let viewController = PromosVC()
            navigationController?.pushViewController(viewController, animated: true)
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        cardView.addGestureRecognizer(tapGesture)
        
        // Enable user interaction for the UIView
        cardView.isUserInteractionEnabled = true

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

    
    @objc func viewTapped() {
        print("cunty")
    }
}

