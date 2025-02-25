//
//  CustomViewportDataSource.swift
//  iosAppYourInterests
//
//  Created by kenjimaeda on 16/08/24.
//  Copyright © 2024 orgName. All rights reserved.
//

//import Foundation
//import MapboxNavigationCore
//import Combine
//import MapboxNavigationCore
//import MapboxNavigationUIKit
//import UIKit
//import MapboxMaps
//
//class CustomViewportDataSource: ViewportDataSource {
//		var options: MapboxNavigationCore.NavigationViewportDataSourceOptions = .init()
//
//		var navigationCameraOptions: AnyPublisher<NavigationCameraOptions, Never> {
//				_navigationCameraOptions.eraseToAnyPublisher()
//		}
//
//		var currentNavigationCameraOptions: NavigationCameraOptions {
//				get { _navigationCameraOptions.value }
//				set { _navigationCameraOptions.value = newValue }
//		}
//
//		private var _navigationCameraOptions: CurrentValueSubject<NavigationCameraOptions, Never> = .init(.init())
//
//		weak var mapView: MapView?
//
//		// MARK: - Initializer methods
//
//		public required init(_ mapView: MapView) {
//				self.mapView = mapView
//		}
//
//		public func update(using viewportState: MapboxNavigationCore.ViewportState) {
//				let newOptions = NavigationCameraOptions(
//						followingCamera: newFollowingCamera(with: viewportState),
//						overviewCamera: newOverviewCamera(with: viewportState)
//				)
//				if newOptions != currentNavigationCameraOptions {
//						_navigationCameraOptions.send(newOptions)
//				}
//		}
//
//		private func newFollowingCamera(with state: MapboxNavigationCore.ViewportState) -> CameraOptions {
//				var followingMobileCamera = currentNavigationCameraOptions.followingCamera
//
//				followingMobileCamera.center = state.location.coordinate
//				// Set the bearing of the `MapView` (measured in degrees clockwise from true north).
//				followingMobileCamera.bearing = state.location.course
//				followingMobileCamera.padding = .zero
//				followingMobileCamera.zoom = 15.0
//				followingMobileCamera.pitch = 45.0
//
//				return followingMobileCamera
//		}
//
//		private func newOverviewCamera(with state: MapboxNavigationCore.ViewportState) -> CameraOptions {
//				guard let mapView else { return .init() }
//
//				var overviewCameraOptions = currentNavigationCameraOptions.overviewCamera
//				let initialCameraOptions = CameraOptions(
//						padding: .zero,
//						bearing: 0.0,
//						pitch: 0.0
//				)
//
//				if let shape = state.routeProgress?.route.shape, let cameraOptions = try? mapView.mapboxMap.camera(
//						for: shape.coordinates.compactMap { $0 },
//						camera: initialCameraOptions,
//						coordinatesPadding: UIEdgeInsets(
//								top: 150.0,
//								left: 10.0,
//								bottom: 150.0,
//								right: 10.0
//						),
//						maxZoom: nil,
//						offset: nil
//				) {
//						overviewCameraOptions = cameraOptions
//				}
//
//				return overviewCameraOptions
//		}
//}
