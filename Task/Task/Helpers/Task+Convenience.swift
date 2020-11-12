//
//  Task+Convenience.swift
//  Task
//
//  Created by Jeremy Taylor on 11/11/20.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String?, due: Date?, isComplete:Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
