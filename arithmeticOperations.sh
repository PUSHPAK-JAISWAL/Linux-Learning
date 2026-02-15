read expression
result=$(echo "scale=4; $expression" | bc -l)
printf "%.3f\n" "$result"
