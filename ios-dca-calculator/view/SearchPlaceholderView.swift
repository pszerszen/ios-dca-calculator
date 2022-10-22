//
//  SearchPlaceholderView.swift
//  ios-dca-calculator
//
//  Created by Piotr Szerszeń on 22/10/2022.
//

import UIKit

class SearchPlaceholderView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imDca"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Search for companies to calculate potential returns via dollar cost avereging."
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 88)
        ])
    }
}
