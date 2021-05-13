//
//  NewArrivalEditView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct NewArrivalEditView: View {
    @State var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = UploadNewItemViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
            Button(action: {
                imagePickerPresented.toggle()
            }, label: {
                VStack{
                    Image(systemName: "photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                    Text("Add Photo")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .frame(width: 180, height: 180)
                .clipped()
                .padding(.top, 56)
                .foregroundColor(.primary)
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
        } else if let image = postImage {
    
            image
                .resizable()
                .scaledToFit()
                .padding(.top)
                .frame( height: 380)
                .clipped()
                .cornerRadius(20)
                .onTapGesture {
                    imagePickerPresented.toggle()
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                
            TextField("Enter Item Name", text: $captionText)
                .padding(.vertical, 20)
                
                
            Button(action: {
                if let image = selectedImage {
                    viewModel.uploadNewItem(itemName: captionText, image: image)
                }
                mode.wrappedValue.dismiss()
            }, label: {
                Text("Upload")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }).padding(.bottom, 10)
            
            Button(action: {
                
                mode.wrappedValue.dismiss()
            }, label: {
                Text("Extit")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 360, height: 50)
                    .background(Color.red.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(15)
            })
        
        }
            
            Spacer()
        }.padding(.horizontal)
    }
}

extension NewArrivalEditView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct AddNewArrivals_Previews: PreviewProvider {
    static var previews: some View {
        NewArrivalEditView()
    }
}
