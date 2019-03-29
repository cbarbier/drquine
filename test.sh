#!/bin/sh
#
# script_test DR QUINE
#
# author: cbarbier
#
#./test.sh [DIR] [EXTENSION]
# example:
#
#   ./test.sh C c
#   ./test.sh GO go
#   ./test.sh ASM s


cd ./$1
make fclean
make Colleen
./Colleen > tmp
diff tmp Colleen.$2
[ $? = 0 ]  && echo "Colleen test1\t\t\033[0;32m✓\033[0m" || echo "Colleen test1\t\t\033[0;31mX\033[0m"
rm tmp

make Grace
./Grace
diff Grace_kid.$2 Grace.$2
[ $? = 0 ]  && echo "Grace test1\t\t\033[0;32m✓\033[0m" || echo "Grace test1\t\t\033[0;31mX\033[0m"

chmod -r Grace_kid.$2
./Grace
[ $? = 0 ]  && echo "Grace test2\t\t\033[0;32m✓\033[0m" || echo "Grace test2\t\t\033[0;31mX\033[0m"
rm Grace_kid.$2

mkdir Grace_kid.$2
./Grace
[ $? = 0 ]  && echo "Grace test3\t\t\033[0;32m✓\033[0m" || echo "Grace test3\t\t\033[0;31mX\033[0m"
rmdir Grace_kid.$2

make Sully
./Sully
make clean
if [ `ls -al | grep Sully | wc -l` -eq 13 ]
then
    echo "Sully test1\t\t\033[0;32m✓\033[0m"
else
    echo "Sully test1\t\t\033[0;31mX\033[0m"
fi
diff Sully.$2 Sully_5.$2
[ $? = 0 ]  && echo "Sully test2\t\t\033[0;32m✓\033[0m" || echo "Sully test2\t\t\033[0;31mX\033[0m"

echo "Check if all the files differ:"
diff  Sully_4.$2 Sully_5.$2 -n | sed -n 3p
diff  Sully_3.$2 Sully_4.$2 -n | sed -n 3p
diff  Sully_2.$2 Sully_3.$2 -n | sed -n 3p
diff  Sully_1.$2 Sully_2.$2 -n | sed -n 3p
diff  Sully_0.$2 Sully_1.$2 -n | sed -n 3p
diff  Sully.$2 Sully_0.$2 -n | sed -n 3p

make fclean;