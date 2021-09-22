# Liquid Flutter Demo App

## Features

**1. Main screen**
Re-layout the Main screen with Bottom Navigation Bar, users can easily see and access the main features of the app.

<img src="/images/main.jpg?raw=true" width="320" /> <img src="/images/main1.jpg?raw=true" width="320" />

**2. Home sceen**
* Event slider
* Trade shortcuts
* Ranking list: fetch data from Binance API and update price real-time by WebSocket

<img src="/images/main.jpg?raw=true" width="320" />

**3. Settings sceen**

<img src="/images/settings.jpg?raw=true" width="320" />

* **Change app theme**

<img src="/images/main.jpg?raw=true" width="300" /> <img src="/images/light.jpg?raw=true" width="300" /> <img src="/images/dark.jpg?raw=true" width="300" />

* **Change app language**

<img src="/images/main.jpg?raw=true" width="320" /> <img src="/images/vietnamese.jpg?raw=true" width="320" />

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
