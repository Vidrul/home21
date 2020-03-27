
import UIKit
import SDWebImage

class MainViewController: UIViewController {
    
    @IBOutlet weak var randomPhoto: UIImageView!
    
    var photoModel: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhoto()
        
        if let photoModel = photoModel {
            configureImage(image: photoModel)
        }
    }
    
}




extension MainViewController {
    
    func configureImage(image: Photo) {
        randomPhoto.backgroundColor = .gray
        if let imageUrlString = image.downloadURL, let url = URL(string: imageUrlString) {
            randomPhoto.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        }
    }
    
    func loadPhoto () {
        NetworkManager.shared.loadImage { result in
            switch result {
            case .success(let photoModel):
                self.photoModel = photoModel
            case .failure(let error):
                print(error)
            }
        }
    }
}
