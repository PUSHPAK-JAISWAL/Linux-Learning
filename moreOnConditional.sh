read a
read b
read c

if [[ $a == $b && $a == $c ]]
then 
	echo "EQUILATERAL"
elif [[ $a == $b || $a == $c || $b == $c ]]
then 
	echo "ISOSCELES"
else
	echo "SCALENE"
	
fi
