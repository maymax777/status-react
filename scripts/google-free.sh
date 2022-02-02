#!/usr/bin/env bash

sed -i -e '$aGOOGLE_FREE=1' .env.release

#------------------------------------
# Remove Android Remote Notifications
#------------------------------------

yarn remove react-native-notifications
rm android/app/google-services.json
sed -i -e '/com.wix.reactnativenotifications.RNNotificationsPackage;/d' android/app/src/main/java/im/status/ethereum/MainApplication.java
sed -i -e '/com.google.gms:google-services/d' android/build.gradle
sed -i -e '/react-native-notifications/d' android/settings.gradle
sed -i -e 's/\["react-native-notifications" :refer (Notifications)\]//' src/status_im/notifications/android_remote.cljs
