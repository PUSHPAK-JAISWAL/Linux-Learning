read n

sum=0

for (( i = 0; i<n; i++ ))
do
	read num
	sum=$((sum+num))
done

echo "scale=4; $sum / $n" | bc -l | xargs printf "%.3f\n"
