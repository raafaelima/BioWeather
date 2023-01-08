# BioWeather

BioWeather is an iOS App to search the weather data for your current location, after biometric authentication.

## About the APP
The app is architected using the principles of Clean/Onion Architecture, SOLID, and MVVM design pattern for UI/Interaction, the user interface was done using SwiftUI. I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. 

All of it was chosen to keep things as simple as possible due to the scope of this project. 
I'm using Fastlane to automate the tests and lint executions. Also, the app is written in Swift 5.

In the app you will find the following structure:
* BioWeather - All the app code is in there
* BioWeatherTests - All the Unit Tests

**Important Point: The UnitTests should be running, using the CMD+U into the _BioWeatherTests_ scheme or with the _make test_ command, as they use some specific .plists and configurations that only that scheme provides.**

## TechDetails

>```bash
>XCode Version 14.2 (14C18)
>iOS: 15.0
>Swift Version: 5.0
>```

### High-Level Architecture

![GeneralArch](https://user-images.githubusercontent.com/7543763/211175168-3e1a57a7-0466-4a15-8634-e9ca6c76c5ea.png)

# App Images

## iPhone 8
| Login             |  Biometric Identification | Weather Information
:-------------------------:|:-------------------------:|:-------------------------:
![Screenshot 2023-01-08 at 01 26 52](https://user-images.githubusercontent.com/7543763/211176667-b8f92327-5f46-40d2-8a43-3953cb343c27.png) |  ![Simulator Screen Shot - iPhone 8 - 2023-01-08 at 01 19 35](https://user-images.githubusercontent.com/7543763/211176635-1bcb895e-c0ab-4b67-a89f-71fe5ed4af13.png) |  ![Screenshot 2023-01-08 at 01 27 23](https://user-images.githubusercontent.com/7543763/211176674-2baab498-adda-4f02-9a2e-9540e5102b4a.png)

## Iphone 14 and DarkMode
| Login             |  Biometric Identification | Weather Information
:-------------------------:|:-------------------------:|:-------------------------:
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-08 at 01 24 47](https://user-images.githubusercontent.com/7543763/211176620-6084076c-6d5d-4116-8439-64cbf1758687.png)  |  ![Simulator Screen Shot - iPhone 14 Pro - 2023-01-08 at 01 19 56](https://user-images.githubusercontent.com/7543763/211176606-556a6e80-d7d8-4dad-94bd-1716ac7504f3.png) |  ![Simulator Screen Shot - iPhone 14 Pro - 2023-01-08 at 00 46 43](https://user-images.githubusercontent.com/7543763/211176596-f23f065c-0f29-42ce-a23a-b32bafa8bf09.png)


## Getting Started

### XCode

To run the project on XCode, you just need to have iOS 15.0 supported versions of Xcode and macOS, the development was made using those support versions below.

1. macOS Monterey 12.5 or higher
2. XCode Version 13 or higher

### Fastlane
If you wanna run the Fastlane scripts, you need to have some ruby version installed on your machine. There's a script on the `make setup` phase that will install the tools needed (homebrew, rbenv, swiftlint, and ruby). 

If you already have the ruby set on your dev machine, you just need to run the `make install` to install the gems and then use the `make test` and `make lint` to run the tests and the lint, respectively.

## Running

1. Run the tests
>
>```bash
>make test
>```

2. List all targets with documentation
>
>```bash
>make
>```

## References
[PACT](https://www.thoughtworks.com/pt/insights/blog/write-quality-mobile-apps-any-architecture)

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
