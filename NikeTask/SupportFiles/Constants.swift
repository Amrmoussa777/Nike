//
//  Constants.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit

struct Images {
    static let avatarPlaceholder = UIImage(named:"nikeLogo")
    static let logoImage = UIImage(named:"nikeLogo")
    static let addProductsIcon = UIImage(named:"addProducts")
    static let filter = UIImage(named:"Filter")
    static let backIcon = UIImage(named: "backIcon")
    static let editIcon = UIImage(named: "editIcon")
    static let gradient = UIImage(named: "gradient")
    static let dollarImage = UIImage(named: "dollarIcon")
    static let checkMark = UIImage(named: "checkMark")
    static let error = UIImage(systemName: "xmark.octagon.fill")
    
    
    static let sliderThumb = UIImage(systemName:"circle.circle.fill" )
    static let sliderMinImage = UIImage(named:"minDollar")
    static let sliderMaxImage = UIImage(named:"maxDollar")
    
    static let linesIVector = UIImage(named:"lines")
    static let boxVector = UIImage(named:"box")
    static let backGVector = UIImage(named:"Background")
}



struct Strings {
    static let namePlaceHolder = "Name"
    static let DescPlaceHolder = "Disceription"
    static let pricePlaceHolder = "Price"
    
    static let addNewTitle = "Add New Product"
    static let addButtonTitle = "Add Product"
    
    static let editTitle = "Edit Product"
    static let editButtonTitle = "Save"
    
    static let fillInfo = "Non Valid Information"
    static let ErrorEdit = "Error Editing Data"
    static let added = "product added successfulyy"
}


struct DBModel{
    struct  Product {
        static let id = "id"
        static let name = "name"
        static let desc = "desc"
        static let image = "image"
        static let price = "price"
    }
}

enum NTerror:String,Error {
    case canNotSave = "Error in saving"
    case canNotRetrive = "Error Getting products"
    case canNotDelete = "Error deleting product"
    
}
