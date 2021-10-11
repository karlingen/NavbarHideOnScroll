//
//  ViewController.swift
//  NavigationTest

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    private let navbarHeight: CGFloat = 44.0
    private let statusBarHeight: CGFloat = 20.0

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white

        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance

        let scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height * 2)


        let label = UILabel()
        label.text = String(repeating: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", count: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        scrollView.addSubview(label)
        scrollView.delegate = self

        self.view.addSubview(scrollView)

        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let navController = self.navigationController {
            var navBarFrame = navController.navigationBar.frame

            // Change y-position
            let newYPosition = min(0, max(-(navbarHeight), (scrollView.contentOffset.y * -1))) + statusBarHeight
            navBarFrame.origin.y = newYPosition
            self.navigationController?.navigationBar.frame = navBarFrame

            NSLog("New Y positon: %f", newYPosition)
        }
    }
}

