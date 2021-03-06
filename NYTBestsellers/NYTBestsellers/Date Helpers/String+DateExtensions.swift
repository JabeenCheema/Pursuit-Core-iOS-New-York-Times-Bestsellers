//
//  String+DateExtensions.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension String {
  // create a formatted date from ISO
  // e.g "MMM d, yyyy hh:mm a"
  // e.g usage addedAt.formattedDate("MMM d, yyyy")
  public func formatISODateString(dateFormat: String) -> String {
    var formatDate = self
    let isoDateFormatter = ISO8601DateFormatter()
    if let date = isoDateFormatter.date(from: self) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = dateFormat
      formatDate = dateFormatter.string(from: date)
    }
    return formatDate
  }
  
  // e.g usage createdAt.date()
  public func date() -> Date {  // this gets me a date object because i want to sort by date 
    var date = Date()
    let isoDateFormatter = ISO8601DateFormatter()
    if let isoDate = isoDateFormatter.date(from: self) {
      date = isoDate
    }
    return date
  }
}
