

# Data Models
![GitHub](https://img.shields.io/github/license/newgymbuddyapp/data_models?style=flat-square)
[![TEST](https://github.com/NewGymBuddyApp/data_models/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/NewGymBuddyApp/flutter_core/actions/workflows/test.yml)

A collection of core classes used for flutter app development. Contains template classes used for models and advanced list mechanisms.

## Prerequisites
```yaml
environment:
  sdk: ">=2.17.0 <3.0.0"
  flutter: ">=1.17.0"
```

## Installation

Add the following snippet to your `pubspec.yaml` file:
```yaml
  data_models:
    git:
      url: https://github.com/NewGymBuddyApp/data_models.git
      ref: release
```


## Usage
- `DataModel` - an abstract class used to standardise models used within the application. Models must extend `DataModel` and override its methods.
- `ListStore` - A facade over lists allowing more advanced operations to be handled internally without the need for lists to clutter their containing models.
