// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit

class FactsViewController: UIViewController {
  
  private let viewModel = FactsViewModel()
  private let factsTblView = UITableView()
  private var factItems : [FactItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    factsTblView.dataSource = self
    factsTblView.isHidden = true
    factsTblView.register(FactItemCell.self, forCellReuseIdentifier: Constants.factCellIdentifier)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension FactsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.factItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.factCellIdentifier, for: indexPath) as! FactItemCell
    
    return cell
  }
  
  
}
