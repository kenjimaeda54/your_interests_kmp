//
//  PlaceAnnotation.swift
//  iosAppYourInterests
//
//  Created by kenjimaeda on 11/08/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared


//implementar uma iamgem protegida
//https://medium.com/@pabloalmontedev/display-async-image-protected-by-header-based-authentication-in-swiftui-297ce00bcaac


struct PlaceAnnotation: View {
	let place: PhotosPlacesWithRelationNearbyModel
	var geometryProxy: GeometryProxy
	
	var body: some View {
		ZStack {
			
			if(!place.photoPlacesModel.icon.isEmpty) {
				AsyncImage(url: URL(string: place.photoPlacesModel.icon)) { image in
					
					image
						.resizable()
						.frame(width: 50,height: 50)
						.aspectRatio(contentMode: .fill)
						.clipShape(Circle())
						.padding([.bottom],geometryProxy.size.height * 0.1)
					
				} placeholder: {
					Image("imageNotFound")
						.resizable()
						.frame(width: 50,height: 50)
						.aspectRatio(contentMode: .fill)
						.clipShape(Circle())
						.padding([.bottom],geometryProxy.size.height * 0.1)
				}
				Text(place.places.name)
					.font(.custom(FontsApp.light, size: 13))
					.foregroundStyle(ColorsApp.white)
					.padding([.horizontal],13)
					.padding([.vertical],5)
					.background(
						ColorsApp.green
							.clipShape(RoundedRectangle(cornerRadius: 10))
					)
			}
		
		}
		 
	}
	
}


