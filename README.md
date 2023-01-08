# BioWeather

BioWeather is an iOS App to search the weather data for you current location, after a biometric authentication.

## About the APP
The app is architected using the principles of Clean/Onion Architecture, SOLID and MVVM design pattern for UI/Interaction, the user interface was done using SwiftUI. I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. 

All of it was chosen to keep the things as simple as possible due to the scope of this project. 
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

## Getting Started
1. macOS Monterey 12.5 or higher
2. Install [HomeBrew](http://brew.sh/)
3. Setup up the environment (be sure to fill the vars)
>
>```bash
># Needed for fastlane
>export LC_ALL=en_US.UTF-8
>export LANG=en_US.UTF-8
>```

4. Setup Environment *
>
>```bash
>make setup
>```

  This will install the following tools (if not present)
  >
  >0. brew packages - rbenv and swiftlint
  >0. ruby 2.6.2, bundler, gems referred in the Gemfile.lock

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
