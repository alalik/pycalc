# ~/.oh-my-zsh/custom/plugins/pycalc/pycalc.plugin.zsh

# Enhanced pycalc: a Zsh function for advanced Python-powered calculations.
# Allow `=` as a function name
unsetopt equals

# Default history file for interactive mode (not used without -i)
PYCALC_HISTORY_FILE="$HOME/.pycalc_history"

# Define `=` function
'='() {
  local OPTIND opt
  local precision=10    # default decimal precision
  local use_decimal=0   # flag for decimal module

  # parse options
  while getopts ":hp:d" opt; do
    case $opt in
      h)
        echo "Usage: = [-h] [-p precision] [-d] expression"
        echo "  -h   Show this help message"
        echo "  -p N Set decimal precision to N places"
        echo "  -d   Use decimal module for high-precision calculations"
        return 0
        ;;
      p) precision=$OPTARG       ;;
      d) use_decimal=1            ;;
      :) echo "Error: -$OPTARG requires an argument." >&2; return 1 ;;
      ?) echo "Error: Invalid option -$OPTARG" >&2; return 1 ;;
    esac
  done
  shift $((OPTIND-1))

  # Ensure expression provided
  if (( $# == 0 )); then
    echo "Error: No expression provided. See -h for help."
    return 1
  fi

  # Reconstruct and normalize expression
  local expr="${*}"
  expr="${expr//π/pi}"
  expr="${expr//ｅ/e}"

  # Execute in Python
  python3 - <<PYCALC
import sys, re
from math import *
${use_decimal:+from decimal import Decimal, getcontext; getcontext().prec = $precision}
expr = "$expr"
# Wrap numerics in Decimal for high precision if requested
if $use_decimal:
    expr = re.sub(r"(?<![\\w.])(\\d+(?:\\.\\d*)?)(?![\\w.])", r"Decimal('\1')", expr)
try:
    res = eval(expr)
    print(res)
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
PYCALC

  return $?
}
