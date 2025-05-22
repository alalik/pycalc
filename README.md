# Pycalc [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) Plugin

`pycalc` turns the `=` key into a powerful, Python‑backed calculator in your Zsh shell.

---

## Features

* **Basic arithmetic**: `= 2+2` → `4`
* **Math functions**: All functions from Python’s `math` module (e.g. `ceil`, `floor`, `sin`, `log`, etc.)
* **Built-in Python**: Access any Python built-in, like `round`, directly.
* **High-precision decimals**: Use the `decimal` module for arbitrary precision via `-d` and `-p` flags.

---

## Installation

Clone the plugin repository and install it into your [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) custom plugins directory:

```bash
git clone https://github.com/alalik/pycalc.git \
  ~/.oh-my-zsh/plugins/pycalc
```

Alternatively, download the plugin file directly:

```bash
curl -fsSL https://raw.githubusercontent.com/alalik/pycalc/main/pycalc.plugin.zsh \
  -o ~/.oh-my-zsh/plugins/pycalc/pycalc.plugin.zsh
```

> Make sure the file path is `~/.oh-my-zsh/plugins/pycalc/pycalc.plugin.zsh`.

2. **Enable the plugin**

   * Open your `~/.zshrc` in an editor.
   * Find the `plugins=(...)` line and add `pycalc`:

     ```zsh
     plugins=(git pycalc other-plugins...)
     ```

3. **Reload your shell**

   ```bash
   exec zsh
   ```

---

## Usage

### Basic calculation

```zsh
= 12 * (3 + 4)
```

### Math functions

```zsh
= ceil(1.2)
= floor(3.8)
= sin(pi/2)
= log(100, 10)
```

### Built-in functions

```zsh
= round(2.3456, 2)
```

### Decimal precision mode

Use `-d` to switch to Python’s `decimal` module. By default, precision is 10 places.

```zsh
= -d 1/3          # ~0.3333333333 (10 digits)
= -p 4 -d 1/7     # ~0.1429 (4 digits)
```

* `-d` activates decimal mode.
* `-p N` sets precision to `N` digits (default `10`).

### Help

```zsh
= -h
```

Displays:

```
Usage: = [-h] [-p precision] [-d] expression
  -h   Show this help message
  -p N Set decimal precision to N places
  -d   Use decimal module for high-precision calculations
```

---

## Examples

Play with basic arithmetic:

```zsh
= 1+2                     # Addition → 3
= 7-3                     # Subtraction → 4
= 5*6                     # Multiplication → 30
= 20/4                    # Division → 5.0
= 10%3                    # Modulus → 1
= 2**10                   # Exponentiation → 1024
= (3+5)*2                 # Parentheses → 16
= -4+8                    # Negative numbers → 4
```

Try out a variety of built-in math functions (note the quotes around expressions with commas):

```zsh
= 2+2                     # Basic arithmetic → 4
= 'ceil(1.2)'             # Ceiling → 2
= 'floor(3.8)'            # Floor → 3
= 'round(2.3456,2)'       # Round to 2 decimals → 2.35
= 'sqrt(16)'              # Square root → 4.0
= 'log(100,10)'           # Log base 10 → 2.0
= 'log10(1000)'           # Log base 10 (alternate) → 3.0
= 'exp(2)'                # e^2 → 7.389056...
= 'sin(pi/2)'             # Sine of 90° → 1.0
= 'cos(pi)'               # Cosine of 180° → -1.0
= 'tan(pi/4)'             # Tangent of 45° → 1.0
= 'factorial(5)'          # 5! → 120
= 'hypot(3,4)'            # sqrt(3^2 + 4^2) → 5.0
= -p 6 -d '22/7'          # Decimal mode with 6-digit precision → 3.142857
= 'pow(2,8)'              # Exponentiation → 256
= 'round(e+pi, 2)'        # Round to 2 decimals → 5.86
```

---

## Troubleshooting

* **`zsh: command not found: =`**

  * Ensure the plugin file is in `~/.oh-my-zsh/plugins/pycalc/pycalc.plugin.zsh`.
  * Confirm `pycalc` is listed in your `plugins=(...)` in `~/.zshrc`.
  * Reload with `exec zsh`.

* **Decimal precision doesn’t change**

  * Use `= -p <N> -d <expression>` (order of flags matters: specify `-p` before `-d`).

* **Syntax errors**

  * Wrap expressions containing spaces or commas in quotes: `= 'round(3.1415, 2)'`.

---

## License

pycalc is released under the [MIT license](LICENSE).