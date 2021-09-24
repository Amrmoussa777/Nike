//
//  DataManager.swift
//  NikeTask
//
//  Created by Amr Moussa on 24/09/2021.
//

import UIKit
import CoreData

class DataManager{
    static let shared = DataManager()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    
    private init(){}
    
    func addNewProduct(newProduct:productModel,completed:@escaping(Result<Any, NTerror>)->()){
        guard let appDelegate = appDelegate else {
            completed(.failure(.canNotSave))
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let productEnity = NSEntityDescription.entity(forEntityName: "Product", in: context)!
        let product = NSManagedObject(entity: productEnity, insertInto: context)
        product.setValue(newProduct.id, forKey: DBModel.Product.id)
        product.setValue(newProduct.name, forKey: DBModel.Product.name)
        product.setValue(newProduct.desc, forKey: DBModel.Product.desc)
        product.setValue(newProduct.price, forKey: DBModel.Product.price)
        product.setValue(newProduct.image.pngData(), forKey: DBModel.Product.image)
        
        do{
            try context.save()
            completed(.success(true))
        }catch  {
            completed(.failure(.canNotSave))
        }
        
    }
    
    func getProducts(completed:@escaping(Result<[productModel], NTerror>)->()){
        var products:[productModel] = []
        guard let appDelegate = appDelegate else {
            completed(.failure(.canNotRetrive))
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let retreiveRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        do{
            let result = try context.fetch(retreiveRequest)
            for data in result as! [NSManagedObject]{
                let id = data.value(forKey: DBModel.Product.id) as! UUID
                let name = data.value(forKey: DBModel.Product.name) as! String
                let desc = data.value(forKey: DBModel.Product.desc) as! String
                let price = data.value(forKey: DBModel.Product.price) as! Int
                let image = data.value(forKey: DBModel.Product.image) as! Data
                
                let product = productModel(id: id, name: name, image: UIImage(data: image) ?? Images.logoImage!, price: price, desc: desc)
                products.append(product)
            }
        }catch{
            completed(.failure(.canNotRetrive))
        }
        completed(.success(products))
    }
    
    func editProductInDB(newProduct:productModel,completed:@escaping(Result<Any, NTerror>)->()){
        guard let appDelegate = appDelegate else {
            completed(.failure(.canNotSave))
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let retreiveRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        let query = NSPredicate(format: "%K == %@", DBModel.Product.id, newProduct.id as CVarArg )
        retreiveRequest.predicate = query
        
        do{
            let oldProduct = try context.fetch(retreiveRequest)
            
            let newObject = oldProduct[0] as! NSManagedObject
            newObject.setValue(newProduct.id, forKey: DBModel.Product.id)
            newObject.setValue(newProduct.name, forKey: DBModel.Product.name)
            newObject.setValue(newProduct.desc, forKey: DBModel.Product.desc)
            newObject.setValue(newProduct.price, forKey: DBModel.Product.price)
            newObject.setValue(newProduct.image.pngData(), forKey: DBModel.Product.image)
            do{
                try context.save()
                completed(.success(true))

            }catch{
                completed(.failure(.canNotSave))
            }
        }catch{
            completed(.failure(.canNotSave))
        }
    }
    
    func deleteProduct(dProduct:productModel,completed:@escaping(Result<Any, NTerror>)->()){
        guard let appDelegate = appDelegate else {
            completed(.failure(.canNotSave))
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let retreiveRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        let query = NSPredicate(format: "%K == %@", DBModel.Product.id, dProduct.id as CVarArg )
        retreiveRequest.predicate = query
        
        do{
            let oldProduct = try context.fetch(retreiveRequest)
            
            let newObject = oldProduct[0] as! NSManagedObject
            context.delete(newObject)
            do{
                try context.save()
                completed(.success(true))

            }catch{
                completed(.failure(.canNotDelete))
            }
        }catch{
            completed(.failure(.canNotDelete))
        }
        
    }
}
