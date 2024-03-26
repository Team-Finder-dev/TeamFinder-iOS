import UIKit

final class LoadingScreenViewController: UIViewController {
    
    // MARK: - Computed properties
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = Asset.launchscreenLogo.image
        view.frame = CGRect(x: 0, y: 0, width: 249, height: 58)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var progressBar: CustomHorizontalProgressView = {
        let progressBar = CustomHorizontalProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        addSubviews()
        constraintsSetup()
        bootApp()
    }
    
    // MARK: - Private methods
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(progressBar)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: 15),
            progressBar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 55),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45)
        ])
    }
    
    // Функция для симуляции загрузки приложения
    //TODO: заменить логику работы на загрузку данных из сети/следующего экрана
    private func bootApp() {
        for number in 0...10 {
            // Обновление шкалы загрузки
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(number)) {
                let progress = CGFloat(number) / 10.0
                self.progressBar.progress = progress
            }
        }
    }
}
