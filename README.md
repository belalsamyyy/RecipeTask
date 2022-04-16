# RecipeTask

## Screenshots
![recipes-screenshots](https://user-images.githubusercontent.com/38237387/163675483-5572e0a9-7047-40fe-9328-ea1c0bed8d67.png)


## Installation
Dependencies in this project are provided via Cocoapods. Please install all dependecies with
```ruby
pod install
```

## `VIPER` Architecture

`V` - View, `I` - Interactor, `P` - Presenter, `E` - Entity, `R` - Router

* View - Responsibility of view is to send user actions to presenter and show whatever the presenter asks it to.
* Interactor - It has the business logic for the app specified by a use case.
* Presenter - Contains the view logic for preparing content for display and for reacting to user interactions.
* Entity - Basic model for objects used by interaction.
* Router - Contains logic for routing of screens.

![viper-arch](https://user-images.githubusercontent.com/38237387/163675822-5d9b71e4-5127-42de-ade4-f941b3489acd.png)
