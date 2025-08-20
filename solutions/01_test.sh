#!/bin/bash

echo "=== Test wc-lite ==="

# Expected values
exp_lines="Lines: 3"
exp_words="Words: 7"
exp_chars="Chars: 36"

# Run solutions
out_lines=$(./01_wc-lite.sh -l 01_data.txt | xargs)
out_words=$(./01_wc-lite.sh -w 01_data.txt | xargs)
out_chars=$(./01_wc-lite.sh -c 01_data.txt | xargs)

# Check results
if [[ "$out_lines" == "$exp_lines" ]]; then
  echo "[PASS] -l option ($out_lines)"
else
  echo "[FAIL] -l option -> got '$out_lines', expected '$exp_lines'"
fi

if [[ "$out_words" == "$exp_words" ]]; then
  echo "[PASS] -w option ($out_words)"
else
  echo "[FAIL] -w option -> got '$out_words', expected '$exp_words'"
fi

if [[ "$out_chars" == "$exp_chars" ]]; then
  echo "[PASS] -c option ($out_chars)"
else
  echo "[FAIL] -c option -> got '$out_chars', expected '$exp_chars'"
fi
