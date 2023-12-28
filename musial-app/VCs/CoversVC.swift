//
//  ViewController.swift
//  musial-app
//
//  Created by Danil Perednja on 27.12.2023.
//

import UIKit

class CoversVC: UIViewController, UITabBarDelegate {
    
    var mainScroll: UIScrollView? = nil
    var coverPosts: [[String: Any]] = []
    var tabBar: UITabBar? = nil
    
    let postCovers: [String] = ["image1", "image2", "image3", "image4", "image5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color to white
        view.backgroundColor = UIColor(named: "#121214")
        
        // Create a UIScrollView
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .black
        
        self.mainScroll = scrollView
        
        fetchDataFromServer()
        createTabBar()
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
    
    func createCards(scrollView: UIScrollView) {
        // Create a banner
        let banner = UIImageView()
        banner.image = UIImage(named: "M_BannerInCovers")
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.contentMode = .scaleAspectFill
        banner.clipsToBounds = true
        banner.layer.cornerRadius = 8
        
        // Create a UIStackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16  // Adjust the spacing between views as needed
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Add cards to the scroll view
        stackView.addSubview(banner)
        
        // Add the scroll view to the view
        view.addSubview(scrollView)
        
//        let coverPosts = self.fetchDataFromServer()
        
        for cardData in self.coverPosts {
            let card = createPreviewCard(image: UIImage(named: self.postCovers.randomElement() ?? "image1"), heading: cardData["name"] as! String, description: (cardData["description"] as! String))
            
            
            stackView.addArrangedSubview(card)
        }
        
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
            banner.heightAnchor.constraint(equalToConstant: 180),
            
            stackView.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
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
    
    func fetchDataFromServer() {
        
        // Replace the URL with the actual URL of your server endpoint
        if let url = URL(string: "http://localhost:3000/api/v1/posts.json") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Check for a successful response
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error: Invalid response")
                    return
                }
                
                // Parse the data
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        self.getCoverPostsFromData(data)
                        
//                        print("Received data: \(json)")
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
                
                DispatchQueue.main.async {
//                    print(self.coverPosts)
                    self.createCards(scrollView: self.mainScroll!)
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func getCoverPostsFromData(_ data: Data) -> Void {
        var coverPosts: [[String: Any]] = []
        
            do {
                // Parse the JSON data into a dictionary
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    // Iterate over the dictionary
    //            for i in json as! [String: Any] {
    //                print(i)
    //            }
                
                // Extract entity parameters
                if let unwrappedArray = json {
                    for dictionary in unwrappedArray {
//                        print(dictionary["name"])
                        if let type = dictionary["type"] as? String {
                            if type == "CoverPost" { coverPosts.append(dictionary) }
                        }
                    }
                }
//                print(json)
                        
                } catch {
                    print("Error parsing JSON: \(error)")
                }
        self.coverPosts = coverPosts
        print(self.coverPosts)
//        print(coverPosts)
        
        
        
        }
    
    @objc func viewTapped() {
        let viewController = PostVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

