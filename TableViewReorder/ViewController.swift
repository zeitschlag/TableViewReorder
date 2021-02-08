//
//  ViewController.swift
//  TableViewReorder
//
//  Created by Nathan Mattes on 08.02.21.
//

import UIKit

extension UITableViewCell {
  static let reuseIdentifer = "Cell"
}

class ViewController: UIViewController {

  @IBOutlet var tableView: UITableView!

  override func viewDidLoad() {
    tableView.isEditing = true
  }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifer, for: indexPath)

    cell.textLabel?.text = "\(indexPath.section).\(indexPath.row)"
    cell.showsReorderControl = true

    return cell
  }

  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return indexPath.section != 0
  }

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //TODO: Implement. Modify model, for example.
  }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .none
  }

  func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    return false
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch (section) {
      case 0:
        return nil
      case 1, 2:
        return "Reorderable"
      default:
        return nil
    }
  }

  func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
    if proposedDestinationIndexPath.section != 0 {
      return proposedDestinationIndexPath
    } else {
      return sourceIndexPath
    }
  }
}
