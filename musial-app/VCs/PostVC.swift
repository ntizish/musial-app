//
//  ViewController.swift
//  musial-app
//
//  Created by Danil Perednja on 27.12.2023.
//

import UIKit

class PostVC: UIViewController, UITabBarDelegate {
    
    var currentPost: [String: Any] = [:]
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
        self.mainScroll = scrollView
        
        fetchDataFromServer()
        createTabBar()
    }
    
    // Meta data is heading, description, author and the artist
    func createPostMetaData(superView: UIScrollView) {
        let headingLabel = UILabel()
        headingLabel.text = "Oh-oh-oh-oh timofey want a your i love romance."
        headingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headingLabel.textColor = .black
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Everything and the want love want bad."
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 2
    }
    
    
    func createTabBar() {
        // Create a UITabBar
        let tabBar = UITabBar()
        tabBar.delegate = self
        tabBar.barTintColor = UIColor.darkGray
        self.tabBar = tabBar
        
        // Create tab bar items
        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "logo-white")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 0)
        let artistTabBarItem = UITabBarItem(title: "Исполнители", image: UIImage(systemName: "square"), tag: 1)
        let coversTabBarItem = UITabBarItem(title: "Обложки", image: UIImage(systemName: "square"), tag: 2)
        let videoTabBarItem = UITabBarItem(title: "Видео", image: UIImage(systemName: "square"), tag: 3)
        let promoTabBarItem = UITabBarItem(title: "Промо", image: UIImage(systemName: "square"), tag: 4)
        
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
    
    func createInitialLayout(scrollView: UIScrollView) {
        // Create a banner
        let banner = UIImageView()
        banner.image = UIImage(named: "image5")
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.contentMode = .scaleAspectFill
        banner.clipsToBounds = true
//        banner.layer.cornerRadius = 8
        
        // Create a UIStackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16  // Adjust the spacing between views as needed
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        let headingLabel = UILabel()
        headingLabel.text = currentPost["name"] as? String
        headingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headingLabel.textColor = .white
        headingLabel.numberOfLines = 4
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = currentPost["description"] as? String
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 10
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bodyText = UITextView()
        bodyText.isScrollEnabled = false
        bodyText.text = currentPost["body"] as? String
        bodyText.font = UIFont.systemFont(ofSize: 18)
        bodyText.backgroundColor = nil
        bodyText.textColor = .white
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        
        let authorName = UILabel()
        authorName.text = "user_2@email.com"
        print(currentPost)
        authorName.font = UIFont.systemFont(ofSize: 14)
        authorName.backgroundColor = nil
        authorName.textColor = .white
        authorName.translatesAutoresizingMaskIntoConstraints = false
        
        // Add cards to the scroll view
        stackView.addSubview(banner)
        stackView.addSubview(headingLabel)
        stackView.addSubview(descriptionLabel)
        stackView.addSubview(authorName)
        stackView.addSubview(bodyText)
        
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
            banner.topAnchor.constraint(equalTo: scrollView.topAnchor),
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            banner.heightAnchor.constraint(equalToConstant: 180),
            
            headingLabel.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 16),
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            authorName.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            authorName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            bodyText.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 32),
            bodyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bodyText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
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
                        self.getPostFromData(data)
                        
//                        print("Received data: \(json)")
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
                
                DispatchQueue.main.async {
//                    print(self.coverPosts)
                    self.createInitialLayout(scrollView: self.mainScroll!)
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func getPostFromData(_ data: Data) -> Void {
        var allPosts: [[String: Any]] = []
        
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
                        if let name = dictionary["name"] as? String {
                            allPosts.append(dictionary)
                        }
                    }
                }
//                print(json)
                        
                } catch {
                    print("Error parsing JSON: \(error)")
                }
        self.currentPost = allPosts.randomElement()!
//        print(coverPosts)
        
        
        
        }
}

