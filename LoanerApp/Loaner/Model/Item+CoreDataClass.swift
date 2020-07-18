//
//  Item+CoreDataClass.swift
//  loaner
//
//  Created by Maryam on 7/16/20.
//  Copyright © 2020 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Item)
public class Item: NSManagedObject {
    func assignLoanee(name: String?, phoneNumber: String?) {
        
        //validate contact has at least one number
        guard let contactNumber = phoneNumber else {
            return print("this contact needed to have at least one number")
        }
        
        if let contactName = name {
            
            //update loanee var
            let newLoanee = Loanee(
                name: contactName,
                contactNumber: contactNumber
            )
            loanee = newLoanee
        } else {
            loanee = Loanee(name: "no name", contactNumber: "no contactNumber")
        }
    }
    
    // Initialize our item attributes with default values
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        // Give properties initial values
        itemTitle = "Untitled item"
        notes = ""
        itemImage = UIImage(named: "no item image")
        loanee = Loanee(name: "", contactNumber: "")
    }
}
