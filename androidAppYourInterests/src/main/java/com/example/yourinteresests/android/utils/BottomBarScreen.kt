package com.example.yourinteresests.android.utils

sealed  class BottomBarScreen (
    val route: String,
    val icon: Int

) {

    data object Favorite : BottomBarScreen(
        route = "favorite",
        icon = com.example.yourinteresests.android.R.drawable.favorite
    )

    data object Search : BottomBarScreen(
        route = "yourLocation",
        icon = com.example.yourinteresests.android.R.drawable.search
    )

    data object Profile : BottomBarScreen(
        route = "profile",
        icon = com.example.yourinteresests.android.R.drawable.profile
    )



}