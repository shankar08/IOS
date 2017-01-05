//
//  ViewController.swift
//  ImageTest
//
//  Created by Shankar Prajapati on 12/13/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    
    var images = [UIImage]()
    var tagValue :Int!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
        imagePicker.allowsEditing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PickAnImage(_ sender: UIButton) {
        
        
        print(sender.tag)
         tagValue = sender.tag
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
           
  
            self.present(imagePicker, animated: true, completion: nil)
        }
        
       
        
    }

//    @IBAction func uploadImage(_ sender: Any) {
//        
//        if let img = imageView.image  {
//            let urlString = "https://post.imageshack.us/upload_api.php"
//            let url = NSURL(string: urlString)
//            let imageData = UIImageJPEGRepresentation(img, 0.3)!
//            let key = "7ADILNST118d647468b0b21726fd43661102bc96".data(using: String.Encoding.utf8)
//            
//            let keyJSON = "json".data(using: String.Encoding.utf8)
//            
//            
//            Alamofire.upload(.post, url, multipartFormData: { multipartFormData in
//                
//                multipartFormData.appendBodyPart(data: imageData, name: "fileupload", fileName: "image", mimeType: "image/jpg")
//                MultipartFormData.appendBodyPart(data: key, name: "key")
//                MultipartFormData.append(data: keyJSON, name: "format")
//                
//            }) { encodingResult in
//                
//                switch encodingResult {
//                case .Success(let upload, _, _):
//                    upload.responseJSON(completionHandler: { request, response, result in
//                        if let info = result.value as? Dictionary<String, AnyObject> {
//                            if let links = info["links"] as? Dictionary<String, AnyObject> {
//                                if let imgLink = links["image_link"] as? String{
//                                    print(imgLink)
//                                }
//                            }
//                        }
//                    })
//                case .Failure(let error):
//                    print(error)
//                }
//            }
//        }
//    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as!UIImage
        
        
        if(tagValue == 1){
            imageView.image = image
        } else if (tagValue == 2){
            secondImage.image = image
        }
        
     //   imageView.image = image
        print(image.description)
        self.dismiss(animated: true, completion: nil);
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       
        self.dismiss(animated: true, completion: nil);
    }
    
    
}

