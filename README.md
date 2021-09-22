# Liquid Flutter Demo App

## Features

**1. Main screen**
Re-layout the Main screen with Bottom Navigation Bar, users can easily see and access the main features of the app.

![](https://i.imgur.com/rzA4RfT.jpg =320x) ![](https://i.imgur.com/gH2uK9X.jpg =320x)

**2. Home sceen**
* Event slider
* Trade shortcuts
* Ranking list: fetch data from Binance API and update price real-time by WebSocket

![](https://i.imgur.com/rzA4RfT.jpg =320x)

**3. Settings sceen**
![](https://i.imgur.com/7zWMaOX.jpg =320x)

* **Change app theme**

![](https://i.imgur.com/rzA4RfT.jpg =200x) ![](https://i.imgur.com/jvCv0Tl.jpg =200x) ![](https://i.imgur.com/facB4zj.jpg =200x)

* **Change app language**

![](https://i.imgur.com/rzA4RfT.jpg =200x) ![](https://i.imgur.com/yi9B2lF.jpg =200x)

## App architecture

![](https://i.imgur.com/iOBhL2S.png)


## Libraries
* **flutter_localizations**: App localization.
* **provider**: State management.
* **get_it**: Dependency injection.
* **dio**: HTTP client for RESTful API.
* **web_socket_channel**: WebSocket client.

## Build & Run app
* Environment: Flutter 2.2.2, Dart 2.13.3
* Run app: 
    `cd` to source directory
    `flutter run` or `flutter run --release` (for best performance)

## Data source
https://binance-docs.github.io/apidocs/spot/en/#24hr-ticker-price-change-statistics
https://binance-docs.github.io/apidocs/spot/en/#websocket-market-streams
