# Flutter CookStore App UI

Thank you for purchasing this product.

## Getting Started

If it's your first time interacting with Flutter, the link below can get you started:

- (http://mobterest.com/2020/04/27/start-flutter/)

## Installation Guide

After purchase, you have received your downloaded package. Follow the steps below:

-  [Create a New Flutter Project: flutter create cookstore](✔)
-  [Paste the contents in the zipped package that you have purchased into the root of cookstore directory and replace](✔)
-  [Navigate to the cookstore directory on the terminal](✔)
-  [Run the command: flutter pub get](✔)
-  [Open your project using your preferred code editor](✔)
-  [If there are no conflicts, run the app on an emulator or phone](✔)

Incase of any questions, you can reach out from the link below: [?]
- (http://mobterest.com/consultancy/)

## App Structure

- This is just a simple guide to navigate through the main folder of the project where development is done: [lib]

[lib]
    |
    [main.dart] - This is the default page. Similar to an index file in the start of a web project. It calls the first Material Page for the application.
    |
    [App.dart] - This is the first Material Page for the application.
    |
    [widgets] - This folder holds different widgets that are reusable within the project and added to different pages
    |
    [utils] - This folder holds functions that can be reused throughout the project
    |
    [pages] - This folder defines the main pages in the application. These pages return a Scaffold widget.
    |
    [globals] - This folder holds the various constants in the project. This is very efficient for customization purposes.
        | - [colors.dart] - holds all the color palettes used in the project. So if all you want to do is change the color brand. This is the file you'll focus on.
        | - [config.dart] - holds configurations that would rather be in one file than distributed in the project.
        | - [constants.dart] - holds Strings, names, texts that are hardcoded from the name of the application to the about information.
        | - [dimensions.dart] -  holds any dimensions involved in the project. e.g padding
        | - [styles.dart] - holds all the styles in the project in one place.
    
Happy Coding ☻