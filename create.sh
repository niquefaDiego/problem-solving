if [ -d "workspace/$1" ]
then
	echo "ERROR: directory workspace/$1 already exists"
	exit 9999
fi

mkdir workspace/$1
cp notebook/template.go workspace/$1/main.go
touch workspace/$1/input.txt

code workspace/$1/main.go
code workspace/$1/input.txt

