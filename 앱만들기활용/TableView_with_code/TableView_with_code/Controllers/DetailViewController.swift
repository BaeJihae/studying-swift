//
//  DetailViewController.swift
//  TableView_with_code
//
//  Created by 배지해 on 1/19/24.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }

}
