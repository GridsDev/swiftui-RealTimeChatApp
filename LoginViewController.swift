import UIKit

class LoginViewController: UIViewController {
    // After Insert Image to Assets.xcassets
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // End imageView
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .while

        navigationItem.rightBarButtonItem = UIBarbuttonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        // Add subviews
        view.addSubview(imageView)
    }
    // After Insert Coding to Extension.swift file
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
    }

    @objc private func didTapRegister() {
        let vc = RegisterViewContriller()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }

}