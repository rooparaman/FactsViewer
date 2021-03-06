// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit

class FactItemCell: UITableViewCell {
  private let padding_20 : CGFloat = 20
  private var viewModel : FactItemViewModel!
  
  private lazy var infoImageView: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.accessibilityIdentifier = Constants.accessibilityIdentifiers.factItemImage.rawValue
    img.clipsToBounds = true
    img.image = UIImage(named: Constants.placeHolderImage)
    return img
  }()
  
  
  private lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.textColor = .black
    label.accessibilityIdentifier = Constants.accessibilityIdentifiers.factItemTitleLabel.rawValue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var descriptionLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.textColor = .black
    label.accessibilityIdentifier = Constants.accessibilityIdentifiers.factItemDescLabel.rawValue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.addSubview(infoImageView)
    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(descriptionLabel)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func configure(title:String,description:String,imageRef:String){
    self.viewModel = FactItemViewModel(title: title, description: description, imageRef: imageRef)
    self.titleLabel.text = viewModel.factTitle
    
    self.descriptionLabel.text = viewModel.factDescription
  
    viewModel.loadThumbnail(urlSting: viewModel.factImageUrl)
    viewModel.image.bind {[weak self] (image) in
      DispatchQueue.main.async {
        self?.infoImageView.image = image
      }
    }
  }
  
  //MARK: Constraints
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      infoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 5),
      infoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: padding_20),
      infoImageView.widthAnchor.constraint(equalToConstant: 80),
      infoImageView.heightAnchor.constraint(equalToConstant: 80)
    ])
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: padding_20),
      titleLabel.leadingAnchor.constraint(equalTo: infoImageView.trailingAnchor,constant: padding_20),
      titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -padding_20),
    ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding_20),
      descriptionLabel.leadingAnchor.constraint(equalTo: infoImageView.trailingAnchor,constant: padding_20),
      descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -padding_20),
      descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -padding_20)
    ])
  }
}
