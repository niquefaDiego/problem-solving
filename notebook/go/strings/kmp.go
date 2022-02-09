package main

import "fmt"

func kmpFailureFunc(s []byte) []int {
	n := len(s)
	ff := make([]int, n)
	for i := 1; i < n; i++ {
		j := ff[i-1]
		for j > 0 && s[j] != s[i] {
			j = ff[j-1]
		}
		if s[j] == s[i] {
			j++
		}
		ff[i] = j
	}
	return ff
}

// ----- TESTING CODE -----

func assertSameArray(a, b []int) {
	if len(a) != len(b) {
		panic("Arrays differ in length")
	}
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			panic("Arrays differ")
		}
	}
}

func TestKMP() {
	assertSameArray(
		kmpFailureFunc([]byte("abacabadabacaba")),
		[]int{0, 0, 1, 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7},
	)

	fmt.Printf("KMP is correct!\n")
}
