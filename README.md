# Flutter Clean Code

## 🛠️ Tech Stacks

- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)
- [BLOC](https://bloclibrary.dev/)

## 📋 Requisitos

- [Dart](https://dart.dev/get-dart/) na versão 3.0.6 ou superior
- [Flutter](https://docs.flutter.dev/get-started/install) na versão 3.10.6 ou superior

## 💡 Utilidades

- [Chocolatey](https://chocolatey.org/)
- [FVM - Flutter Version Manager](https://fvm.app/)

## 🚀 Desenvolvendo

### Instale as dependências

```sh
  flutter pub get
```

### Gerar código de injeção de dependência

```sh
  flutter pub run build_runner build --delete-conflicting-outputs
```

### Rode o projeto

```sh
  flutter run
```

### Limpar cache do APP

```sh
  flutter clean
```

### Gerar novos estados pra lib match

```sh
  flutter pub run build_runner watch -d
```

Gerencie o APP via emulador.

### ⚙️ Build para distribuição

### Android

```sh
  flutter build apk --release
```

### iOS

```sh
  flutter build ios --release
```

## 🌐 Links úteis

- [Figma]()
