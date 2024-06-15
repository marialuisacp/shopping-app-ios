# Shopping App iOS

Welcome to Shopping App iOS, a sample shopping app built to study SwiftUI and iOS development. This project utilizes the native iOS development stack and is implemented using Swift and SwiftUI.

Develop by @marialuisacp.

![Shopping App iOS](./docs/cover_repo.png)

## Overview

Shopping App iOS fetches product data from the [Fake Store API](https://fakestoreapi.com/), providing a list of products, filtering options, and detailed information about each product. It aims to showcase the usage of SwiftUI for building modern and intuitive user interfaces in iOS apps.

## Features

- Fetches product data from the Fake Store API
- Displays a list of products with images, titles, prices, and categories
- Supports filtering products by category
- Provides detailed information about each product, including description, price, and image

## Technologies

The main technologies used in this project are:
- Swift
- SwiftUI
- URLSession
- CoreData
- React Native Module

![Swift UI description](./docs/01_swiftUI.png)

In this project, SwiftUI was employed to design native components and screens for iOS, encompassing all primary interfaces. 

Other Native Resources
Alongside visual development, the app interacts with the store through requests to fetch products and product categories, facilitated by URLSession. 

Persistence of shopping cart data is achieved using CoreData, ensuring seamless management and retention of user selections within the application.

![React Native Module description](./docs/02_react_native_module.png)

To explore the integration of React Native modules into the app, we developed an RN module that is accessible in [this repository](https://github.com/marialuisacp/shopping-app-module-rn).

The module was integrated using RCTView in Swift, incorporating React Native libraries into the project. Additionally, a Bridge Manager was implemented to facilitate seamless communication between the native and React Native environments.

## Requirements

- Xcode 12 or later
- Swift 5.0 or later
- Internet connection to fetch data from the Fake Store API

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device.

## Usage

Upon launching the app, you will be presented with a list of products. You can tap on any product to view its details. The app also allows you to filter products by category using the provided filter options.

## Credits

- Fake Store API: [https://fakestoreapi.com/](https://fakestoreapi.com/)
- SwiftUI: [https://developer.apple.com/xcode/swiftui/](https://developer.apple.com/xcode/swiftui/)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as per your requirements.