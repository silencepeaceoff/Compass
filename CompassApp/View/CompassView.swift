//
//  CompassView.swift
//  CompassApp
//
//  Created by Dmitrii Tikhomirov on 5/11/23.
//

import UIKit

class CompassView: UIView {

  private let compassImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .center
    view.contentMode = .scaleAspectFit
    return view
  }()
  private let needleImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .center
    view.contentMode = .scaleAspectFit
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubviews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSubviews()
  }

  private func setupSubviews() {
    compassImageView.image = UIImage(named: "compass")
    needleImageView.image = UIImage(named: "needle")

    addSubview(compassImageView)
    addSubview(needleImageView)

    compassImageView.translatesAutoresizingMaskIntoConstraints = false
    needleImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      compassImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      compassImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      compassImageView.heightAnchor.constraint(equalToConstant: 360),
      compassImageView.widthAnchor.constraint(equalTo: compassImageView.heightAnchor),

      needleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      needleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      needleImageView.heightAnchor.constraint(equalTo: compassImageView.heightAnchor, multiplier: 0.8),
      needleImageView.widthAnchor.constraint(equalTo: compassImageView.heightAnchor)
    ])
  }

  func update(rotation: CGFloat) {
    UIView.animate(withDuration: 0.2) {
      self.needleImageView.transform = CGAffineTransform(rotationAngle: rotation)
    }
  }
}

