## Release: v0.1.3

- Introduced generic CRUD methods in generated service classes.
- Added foundational logic for interacting with the local database in generated local service classes.
- Generated controllers now include basic methods.
- Both generated controller and service classes now come with prebuilt logic for CRUD operations.
- Removed the controller generator command.
- Updated the page generator command to include controller generation alongside the page.
- Optimized the generation process to enhance performance.
- **Full Changelog**: [Release: v0.1.3](https://github.com/thedevsbuddy/flutter_modulr/commits/v0.1.3)

## Release: v0.1.2

- Fixed issue where it was having issue on generating new Module.

## Release: v0.1.1

- Added formatter for generated modules which formats the code each time a new module is generated.
- Added feature to add export for the new module from the `lib/app/modules/modules.dart` file when generating a new module.
- Added feature to generate `Model` class for the Module when generating a new module.
- Added feature to automatically add export for the `Model` class from the `lib/app/models/models.dart` file when generating a new module.
- Added feature to add export for generated controller from `lib/app/modules/<module>/<module>_module.dart` when generating single `controller`.
- Added feature to add export for generated page from `lib/app/modules/<module>/<module>_module.dart` when generating single `page`.
- Bug fixes.
- **Full Changelog**: [Release: v0.1.1](https://github.com/thedevsbuddy/flutter_modulr/commits/v0.1.1)

## Release: v0.1.0

- Created all the generators
- Initial Setup
- **Full Changelog**: [Release: v0.1.0](https://github.com/thedevsbuddy/flutter_modulr/commits/v0.1.0)
