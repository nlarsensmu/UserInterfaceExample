//
//  ViewController.swift
//  UserInterfaceExample
//
//  Created by Nicholas Larsen on 9/1/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    lazy var imageModel = { () -> ImageModel in
        return ImageModel.sharedInstance()
    }() // this is a block in swift, this will be run the first time it is accessed
    
    // Optional that is implicatally unwrapped, could be nil will cause error if accessed and nil
    // We are going to be in charge of creating and handleing this
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(self.disaplayImageName))
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var disaplayImageName = "Eric" // public property in the ViewController Class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.imageView.image = UIImage.init(named: "Eric")
        
//        self.imageView.image = self.imageModel.getImageWithName(self.diaplayImageName)
        
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
        }
        
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}

