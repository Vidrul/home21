
import UIKit
import SDWebImage
class SecondViewController: UIViewController {
    
    @IBOutlet weak var grayscaleSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var image: UIImageView!
    
    var blurValue = 0
    var graysca: String = "grayscale"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func grayscaleSwitch(_ sender: UISwitch) {
        switchValueDidChange()
    }
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        setImage()
    }
    
    @IBAction func slideBlur(_ sender: UISlider) {
        blurValue = Int(slider.value)
    }
}

extension SecondViewController {
    
    func setImage() {
        if blurValue == 0 {
            let urlString = "https://picsum.photos/800/600?\(graysca)"
            let url = URL(string: urlString)
            image.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        } else {
            let urlString = "https://picsum.photos/800/600?\(graysca)&blur=\(blurValue)"
            let url = URL(string: urlString)
            image.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
        }
    }

    func switchValueDidChange() {
        if grayscaleSwitch.isOn == true {
            graysca = "grayscale"
        } else {
            graysca = ""
        }
    }
}


