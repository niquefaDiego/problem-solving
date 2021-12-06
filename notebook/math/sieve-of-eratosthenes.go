package main

// Sieve Of Eratosthenes

const MAX_VALUE = int(2e7 + 3)

var smallesDiv [MAX_VALUE]int

func RunSieve() {
	var i, j int
	for i = 2; i*i < MAX_VALUE; i += 1 {
		if smallesDiv[i] != 0 {
			continue
		}
		smallesDiv[i] = i
		for j = i * i; j < MAX_VALUE; j += i {
			if smallesDiv[j] == 0 {
				smallesDiv[j] = i
			}
		}
	}
}

// Get unordered list of all divisors of n

var divisors []int = make([]int, 1000)
var nDivisors int

func GetDivisors(num int) {
	if num == 1 {
		divisors[0] = 1
		nDivisors = 1
		return
	}
	var p = smallesDiv[num]
	if p == 0 {
		divisors[0] = 1
		divisors[1] = num
		nDivisors = 2
		return
	}
	var e = 0
	for ; num%p == 0; num /= p {
		e++
	}
	GetDivisors(num)
	var pp = 1
	for i := 1; i <= e; i++ {
		pp = pp * p
		for j, jj := nDivisors*i, 0; jj < nDivisors; j++ {
			divisors[j] = divisors[jj] * pp
			jj++
		}
	}
	nDivisors *= e + 1
}
