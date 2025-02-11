# Flutter Modulr: v0.1.3

A Module generator for [`FlutterFusion`](https://github.com/thedevsbuddy/flutter_fusion) project, FlutterFusion is a Flutter starter project with `MVC` pattern.

## Usage

Below is the example of how you can use this package and provided commands

1. `modulr:generate`: This is generates whole code for a module.
2. `modulr:controller`: This command generates a Controller file inside the provided module.
3. `modulr:page`: This command generates a Page/View file inside the provided module.

### Generate Module

```shell
dart pub run modulr:generate Blog
```

This will generate all the files required for a `Module`

#### Generated Files Inside your project's `lib/app/modules` directory.

```txt
📂 blog
├── 📂 controllers
│   └── 📄 blog_controller.dart
├── 📂 routes
│   ├── 📄 blog_router.dart
│   └── 📄 blog_routes.dart
├── 📂 services
│   ├── 📄 api_blog_service.dart
│   ├── 📄 blog_service.dart
│   └── 📄 local_blog_service.dart
├── 📂 views
│   └── 📄 blog_page.dart
└── 📄 blog_module.dart
```

### Generate Page/View

```shell
dart pub run modulr:page Comment --on=blog
```

This will generate the new view/page (`comment_page.dart`) along with it's controller (`comment_controller.dart`) file inside the `Blog` Module.

#### Generated files (including previously generated views)

```txt
📂 blog
├── 📂 controllers
│   ├── 📄 blog_controller.dart
│   └── 📄 comment_controller.dart
├── 📂 views
│   └── 📄 blog_page.dart
│   └── 📄 comment_page.dart
```
