// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit

class FactsViewController: UIViewController {
  
  private let viewModel = FactsViewModel()
  private let factsTblView = UITableView()
  private var factItems : [FactItem] = []
  
  private lazy var activityIndicator : UIActivityIndicatorView = {
    var activityInd: UIActivityIndicatorView
    if #available(iOS 13.0, *) {
      activityInd = UIActivityIndicatorView(style: .large)
    } else {
      // Fallback on earlier versions
      activityInd = UIActivityIndicatorView(style: .gray)
    }
    activityInd.center = self.view.center
    activityInd.hidesWhenStopped = true
    activityInd.color = .black
    return activityInd
  }()
  
  private lazy var errorLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    factsTblView.dataSource = self
    factsTblView.register(FactItemCell.self, forCellReuseIdentifier: Constants.factCellIdentifier)
    
    factsTblView.refreshControl = UIRefreshControl()
    factsTblView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    
    viewModel.facts.bind {[weak self] (facts) in
      guard let self = self else { return }
      self.factItems = facts
      DispatchQueue.main.async {
        self.errorLabel.isHidden = facts.count == 0 ? false : true
        self.hideProgressIndicators()
        self.factsTblView.reloadData()
      }
    }
    
    viewModel.fetchFailure.bind {[weak self] (isfailure) in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.errorLabel.isHidden = false
        self.hideProgressIndicators()
      }
    }
    
    viewModel.errorReason.bind {[weak self] (error) in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.errorLabel.text = error
      }
    }
    
    viewModel.title.bind {[weak self] (title) in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.navigationItem.title = title
      }
    }
    DispatchQueue.main.async {
      self.activityIndicator.startAnimating()
    }
    
    viewModel.fetchAllFacts()
    
    loadViews()
  }
  
  private func hideProgressIndicators(){
    DispatchQueue.main.async {
      if self.activityIndicator.isAnimating {
        self.activityIndicator.stopAnimating()
      }
      if let refreshCtrl = self.factsTblView.refreshControl, refreshCtrl.isRefreshing {
        self.factsTblView.refreshControl?.endRefreshing()
      }
    }
  }
  
  private func loadViews(){
    self.view.backgroundColor = .white
    errorLabel.isHidden = true
    factsTblView.translatesAutoresizingMaskIntoConstraints = false
    factsTblView.rowHeight = UITableView.automaticDimension
    factsTblView.estimatedRowHeight = 140.0
    view.addSubview(factsTblView)
    view.addSubview(activityIndicator)
    view.addSubview(errorLabel)
    setupConstraints()
  }
  
  private func setupConstraints() {
    let safeArea = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      factsTblView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
      factsTblView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
      factsTblView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
      factsTblView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      errorLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
      errorLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
      errorLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
    ])
  }
  
  @objc func handleRefreshControl() {
    viewModel.fetchAllFacts()
  }

  
}

//MARK: - UITableViewDataSource Methods
extension FactsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.factItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.factCellIdentifier, for: indexPath) as! FactItemCell
    
    cell.configure(title: factItems[indexPath.row].title,
                   description: factItems[indexPath.row].description,
                   imageRef: factItems[indexPath.row].imageUrl)
    
    return cell
  }
  
  
}
