# Laporan Praktikum PEMROGRAMAN MOBILE

| Nama      | NIM      | Kelas      | Mata Kuliah | Semester |
|-----------|----------|------------|-------------|----------|
| Giovano Alkandri | 2341720096| TI-3H| PEMROGRAMAN MOBILE    | 5        |


## Latihan Praktikum 1, 2, 3, 4

Praktikum 1 2 3 4

![Image](/w6/layout_flutter/images/p1234.gif)

## Tugas Praktikum 1

Hasil Tugas Praktikum 1

![Image](/w6/basic_layout_flutter/img/tugasprak1.gif)


## Praktikum 5 & Tugas Praktikum 2

Hasil Tugas Praktikum 2

![Image](/w6/belanja/img/tp2.gif)

## Modifikasi dengan plugin go_router

### Instalasi go_router

1. Buka terminal dan jalankan perintah berikut untuk menambahkan dependency go_router:
    ```bash
    flutter pub add go_router
    ```
2. Jalankan perintah untuk mengunduh dependency:
    ```bash
    flutter pub get
    ```

3. Import go_router di file Dart:
    ```dart
    import 'package:go_router/go_router.dart';
    ```

### Tambahkan kode berikut
```Dart
    void main() {
        runApp(MyApp());
        }

        final GoRouter _router = GoRouter(
        routes: [
            GoRoute(
            path: '/',
            builder: (context, state) => HomePage(),
            ),
            GoRoute(
            path: '/item',
            builder: (context, state) => ItemPage(),
            ),
        ],
        );

        class MyApp extends StatelessWidget {
        const MyApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp.router(
            routerConfig: _router,
            );
        }
    }
```