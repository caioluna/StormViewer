//
//  DetailViewController.swift
//  Project1
//
//  Created by Caio Luna on 20/06/25.
//

import UIKit

class DetailViewController: UIViewController {
	
	@IBOutlet var imageView: UIImageView!
	
	var selectedImage: String?
	var imageTitle: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = imageTitle
		navigationItem.largeTitleDisplayMode = .never
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		
		if let imageToLoad = selectedImage {
			imageView.image = UIImage(named: imageToLoad)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}
	
	@objc func shareTapped() {
		
		guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
			print ("No image found")
			return
		}
		
		let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}
	
}
