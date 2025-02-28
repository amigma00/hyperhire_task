# HyperHire Task

A Flutter project built with modern UI components and state management using `flutter_bloc`.

## Features

- **Carousel Slider**: Displays images in a sliding carousel.
- **Flutter Bloc**: Implements state management efficiently.
- **Flutter SVG**: Supports scalable vector graphics for better UI performance.
- **Google Fonts**: Enhances typography with a variety of fonts.
- **Smooth Page Indicator**: Provides smooth and customizable page indicators.

## Dependencies Used

- [`carousel_slider`](https://pub.dev/packages/carousel_slider) - For implementing image carousels.
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) - State management solution using the BLoC pattern.
- [`flutter_svg`](https://pub.dev/packages/flutter_svg) - Handles SVG images seamlessly in Flutter apps.
- [`google_fonts`](https://pub.dev/packages/google_fonts) - Integrates Google Fonts to improve text styling.
- [`smooth_page_indicator`](https://pub.dev/packages/smooth_page_indicator) - Adds elegant page indicators for sliders.

## Getting Started

1. Clone this repository:
   ```sh
   git clone https://github.com/amigma00/hyperhire_task.git

Moreover we can use many more practices depending upon the project requirements, like dependency injections `get_it`, `MediaQuery` or `flutter_screenutil` for resposiveness. I haven't found any need of state managemnt in the task except animating the dots for caraousal for which I have used simple `setState` method. For advanced routing `go_router` is a good solution. Live Production projects which have considerable user base can be developed with `Clean Architecture` as it can be more testable and scalable. I Would recommend my other task in which I have used some some good packages and practices. [`Link to the repo`](https://github.com/amigma00/realtime_innovations_task.git)
