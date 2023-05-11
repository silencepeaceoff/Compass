//
//  ViewController.swift
//  CompassApp
//
//  Created by Dmitrii Tikhomirov on 5/11/23.
//

import UIKit
import CoreLocation

class CompassViewController: UIViewController, CLLocationManagerDelegate {

  // MARK: - Properties

  private let locationManager = CLLocationManager()
  private let compassImageView = CompassView()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    // Set up the location manager
    locationManager.delegate = self
    locationManager.startUpdatingHeading()

    // Set up the compass image view
    compassImageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(compassImageView)

    // Set up the constraints for the compass image view
    NSLayoutConstraint.activate([
      compassImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      compassImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  // MARK: - CLLocationManagerDelegate

  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    // Update the rotation angle of the compass image view based on the heading value
    let rotationAngle = CGFloat(newHeading.magneticHeading * Double.pi / 180)
    compassImageView.update(rotation: rotationAngle)
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Failed to get location updates: \(error.localizedDescription)")
  }

}



