# homebrew-tap

Homebrew tap repository for BabelCloud tools.

## Available Formulas

### ht (Headless Terminal)

A headless terminal providing programmatic access to a terminal interface. This tool allows you to interact with terminal applications programmatically.

- Current version: 0.3.0
- Supported platforms: macOS (Intel and Apple Silicon)
- License: Apache-2.0

## Installation

First, add this tap to your Homebrew:

```bash
brew tap babelcloud/tap
```

Then install the desired formula:

```bash
brew install babelcloud/tap/ht
```

Or you can install directly without tapping first:

```bash
brew install babelcloud/tap/ht
```

## Local Development and Testing

To test formulas locally before submitting changes:

1. Clone this repository:

```bash
git clone https://github.com/babelcloud/homebrew-tap.git
cd homebrew-tap
```

2. Create a local tap link:

```bash
brew tap-new $USER/temp-tap
```

3. Test installation from the local formula:

```bash
brew install --build-from-source ./ht.rb
```

4. Run formula tests:

```bash
brew test ./ht.rb
```

5. Audit the formula for potential issues:

```bash
brew audit --strict --online ./ht.rb
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Make your changes
4. Test your changes locally using the steps above
5. Submit a Pull Request

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
