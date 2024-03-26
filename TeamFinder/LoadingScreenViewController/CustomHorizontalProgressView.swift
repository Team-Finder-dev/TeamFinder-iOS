import UIKit

final class CustomHorizontalProgressView: UIView {

    var progress: CGFloat = 0.0 {
        didSet {
            setProgress()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Asset.loaderBackgroundColor.color
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw( _ rect: CGRect) {
        super.draw(rect)
        setProgress()
    }

    private func setProgress() {
        var progress = self.progress
        progress = progress > 1.0 ? progress / 100 : progress

        self.layer.cornerRadius = bounds.height / 2.0
        self.layer.borderColor = Asset.loaderBorderColor.color.cgColor
        self.layer.borderWidth = 3.0

        let margin: CGFloat = 6.0
        var width = (bounds.width - margin)  * progress
        let height = bounds.height - margin

        if width < height {
            width = height
        }

        let pathRef = UIBezierPath(roundedRect:
                                    CGRect(
                                        x: margin / 2.0,
                                        y: margin / 2.0,
                                        width: width,
                                        height: height
                                    ),
                                   cornerRadius: height / 2.0
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = pathRef.cgPath
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            Asset.loaderStartGradientColor.color.cgColor,
            Asset.loaderEndGradientColor.color.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.mask = maskLayer
        layer.addSublayer(gradientLayer)
    }
    
}
