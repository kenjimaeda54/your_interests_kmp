package com.example.yourinterest.data.client

import com.example.yourinterest.data.model.placesnearby.PlacesNearbyEntity
import com.example.yourinterest.util.DataOrException
import io.ktor.client.call.body
import io.ktor.client.request.get
import io.ktor.client.request.headers
import io.ktor.http.HttpStatusCode

class PlacesNearbyClient(private  val ktorApi: KtorApi): KtorApi by ktorApi {

       //kttor https://ktor.io/docs/client-requests.html#text
      suspend fun fetchPlacesNearby(latitude: Double,longitude: Double): DataOrException<PlacesNearbyEntity, Exception, Boolean> {

           return try {
              val result = client.get("/v3/places/nearby?l=${latitude},${longitude}")
              if (result.status != HttpStatusCode.OK) {
                  throw Exception("Error fetching places nearby")
              }
              DataOrException(data = result.body(), exception = null, isLoading = false)
          }catch (exception: Exception) {
               DataOrException(data = null, exception = exception, isLoading = false)
            }

      }

}