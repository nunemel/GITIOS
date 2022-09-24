//
//  ViewController.swift
//  ISpy
//
//  Created by Nune Melikyan on 28.08.22.
//

import UIKit

final class ISpyViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
    
    // MARK: - UIScrollViewDelegate methods for zooming
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width/scrollView.bounds.width
        let heightScale = size.height/scrollView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}
