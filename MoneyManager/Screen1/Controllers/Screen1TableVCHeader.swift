//
//  Screen1TableViewCellHeader.swift
//  MoneyManager
//
//  Created by Roman on 26.01.2021.
//

import UIKit

class Screen1TableVCHeader: UITableViewCell {
  @IBOutlet var labelHeaderDate: UILabel!

  var delegateScreen1: protocolScreen1Delegate?
  var specCellTag: Int = 0

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func startCellEmpty() {
    print("HeaderEmpty: ---")
    labelHeaderDate.text = "No entries yet."
  }


  func startCell() {
    print("Header1: ---")
    let formatterPrint = DateFormatter()
    formatterPrint.timeZone = TimeZone(secondsFromGMT: 10800) // +3 час(Moscow)
    formatterPrint.dateFormat = "d MMMM YYYY"
    labelHeaderDate.text = formatterPrint.string(from: ViewModelScreen1.shared.returnDataArrayOfOperations()[specCellTag].date)
  }

  func startCell2() {
    print("Header2: ---")
    let formatterPrint = DateFormatter()
    formatterPrint.dateFormat = "d MMMM YYYY"
    let specVar: Int = specCellTag - ViewModelScreen1.shared.returnArrayForIncrease()[specCellTag - 1]
    print("222: \(formatterPrint.string(from: ViewModelScreen1.shared.returnDataArrayOfOperations()[specVar].date))")
    labelHeaderDate.text = formatterPrint.string(from: ViewModelScreen1.shared.returnDataArrayOfOperations()[specVar].date)
  }

  func setTag(tag: Int) {
    specCellTag = tag
  }
}