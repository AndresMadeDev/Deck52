//
//  ImageUploader.swift
//  Deck52
//
//  Created by Andres Made on 5/13/21.
//

import UIKit
import Firebase

enum uploadType{
    case profile
    case newArrival
    case schedule
    
    var filePath: StorageReference{
        let fileName = NSUUID().uuidString
        switch self {
        case.profile:
            return Storage.storage().reference(withPath: "/profile_images \(fileName)")
        case.newArrival:
            return  Storage.storage().reference(withPath: "/newItem_images \(fileName)")
        case.schedule:
            return  Storage.storage().reference(withPath: "/profile_images \(fileName)")
            
        }
    }
}



struct ImageUploader {
    static func uploadImage(image: UIImage, type: uploadType, completion: @escaping(String) -> Void ) {
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        let ref = type.filePath
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print ("DEBUG>>>>>> Fail to upload image \(error.localizedDescription)")
                return
            }
            
            print("Sucsess Uploaded Image.....")
            
            ref.downloadURL { url, _  in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
