# job_city_challenge

A new Flutter project.

## Getting Started

The project runs on flutter version 3.0.3

## Commands to run the application

```
flutter pub get
flutter run
```

## Command to generate and install the apk in your android device

```
flutter build apk --split-per-abi
flutter install
```
## the pplication uses the following dependancies
```
cupertino_icons: ^1.0.2
  get: ^4.6.5
  dio: ^4.0.6
  get_it: ^7.2.0
  lottie: ^1.3.0
  shared_preferences: ^2.0.15
  intl: ^0.17.0
  flutter_staggered_grid_view: ^0.6.1
  flutter_svg: ^1.1.0
  bottom_navy_bar: ^6.0.0
  flutter_native_splash: ^2.0.5
  flutter_launcher_icons_maker: "^0.10.1"
  pin_code_fields: ^7.3.0
```
## Project Structure Overview
<img width="289" alt="Screenshot 2022-06-27 at 14 58 36" src="https://user-images.githubusercontent.com/26327635/175936019-1204aad4-d207-4aa6-8d84-5806daeab675.png">

## Architecture Overview
The main architectural concept used in the App was Clean Architecture. A multi-layer architecture that facilitates unit testing and helps us with separation of responsibilities. Another objective of this architecture is to facilitate the scalability of the App with new features.

The functions of each layer are described in the following sections below.

Dependency Injection
The project uses the get_it package to facilitate the organization of dependency injection. Control is done by the injection container.

Design Patterns
The project makes use of some Design Patterns such as:

Singleton and Factory – Creational Patterns
Adapter and Decorator – Structural Patterns
Strategy – Behavioral Pattern
SOLID Principles
Other good practices present in the project are Clean Code for more descriptive nomenclature and the SOLID principles.

Domain Layer
Here is where we can find our Entities and UseCases. This is the core of our architecture, the entities define the objects of our system and the usecases are the actions the application is supposed to perform.

Data Layer
In this layer we have the implementation of our UseCases and the creation of our Models or DTOs (Data Transfer Objects) to translate the external data to our entities. We also have interfaces that define how we should implement http or cache adapters.

Infra Layer
In the Infra layer, we have the implementation of our services. It is the layer responsible for creating the decoupling point between our system and external dependencies.

Presentation Layer
Our Presentation Layer contains the Controllers for our view. Controllers or Presenters are responsible for the Presentation Logic.

UI Layer
The UI layer is where our screens and visual components will be. In the case of Flutter, this is where we will have our Widgets.
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Job_city_TVMaze_challenge
