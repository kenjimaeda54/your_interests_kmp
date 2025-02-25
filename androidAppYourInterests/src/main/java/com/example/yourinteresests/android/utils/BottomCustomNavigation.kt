package com.example.yourinteresests.android.utils

import androidx.compose.runtime.Composable
import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.layout.size
import androidx.compose.material.BottomNavigation
import androidx.compose.material.BottomNavigationItem
import androidx.compose.material.Colors
 import androidx.compose.material3.Icon
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavDestination
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.NavHostController
import androidx.compose.material3.MaterialTheme



@Composable
fun BottomCustomNavigation(navHostController: NavHostController, navDestination: NavDestination) {

    BottomNavigation(
        backgroundColor = MaterialTheme.colorScheme.primary
    ) {
        BottomScreens.screens().forEach {
            AddItem(
                navController = navHostController,
                screen = it,
                currentDestination = navDestination
            )
        }
    }

}


@Composable
fun RowScope.AddItem(
    navController: NavController,
    screen: BottomBarScreen,
    currentDestination: NavDestination
) {
    BottomNavigationItem(
        selected = currentDestination.hierarchy.any {
            it.route == screen.route
        },
        onClick = {
            navController.navigate(screen.route) {
                popUpTo(navController.graph.findStartDestination().id) {
                    saveState = true
                }
                launchSingleTop = true
                restoreState = true
            }
        },
        icon = {
            Icon(
                modifier = Modifier.size(20.dp), contentDescription = "Icon Navigation",
                painter = painterResource(id = screen.icon),
                tint =  if(
                    currentDestination.hierarchy.any {
                        it.route == screen.route
                    }
                ) MaterialTheme.colorScheme.secondary else MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.60f)
            )
        },
      )
}