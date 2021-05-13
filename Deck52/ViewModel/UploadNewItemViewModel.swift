//
//  UploadNewItemViewModel.swift
//  Deck52
//
//  Created by Andres Made on 5/13/21.
//

import SwiftUI
import Firebase

class UploadNewItemViewModel: ObservableObject {
    func uploadNewItem(itemName: String, image: UIImage){
        
        ImageUploader.uploadImage(image: image, type: .newArrival) { imageURL in
            let data = [
                "itemName": itemName,
                "imageURL": imageURL
            ]
            
            Firestore.firestore().collection("newItem").addDocument(data: data) { _ in
                print("DEBUG: UPLOADED NEW ITEM")
            }
        }
    }
}
