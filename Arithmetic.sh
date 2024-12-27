echo -e "Please enter some value: \c"
read -r a
echo -e "Please enter another value: \c"
read -r b

echo "a+b value is $(($a+$b))"    
echo "a-b value is $(($a-$b))"     
echo "axb value is $(($a*$b))"    #it will multiply both a and b
echo "a/b value is $(($a/$b))"    #it will divide b from a
echo "a%b value is $(($a%$b))" 