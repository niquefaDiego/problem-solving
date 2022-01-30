package main

import (
	"fmt"
	"math"
	"math/cmplx"
)

func NextPowerOfTwo(n int) int {
	n--
	n |= n >> 1
	n |= n >> 2
	n |= n >> 4
	n |= n >> 8
	n |= n >> 16
	n++
	return n
}

func DiscreteFourierTransform(c []complex128, inv bool) []complex128 {
	var n = len(c)
	if n == 1 {
		return c
	}

	var half = n >> 1
	var c0 = make([]complex128, half)
	var c1 = make([]complex128, half)
	for i := 0; i < half; i++ {
		c0[i] = c[i<<1]
		c1[i] = c[(i<<1)+1]
	}

	var ang = 2 * math.Pi / float64(n)
	if inv {
		ang *= -1
	}
	var wn = cmplx.Exp(complex(0, ang))
	var w complex128 = 1 + 0i

	c0 = DiscreteFourierTransform(c0, inv)
	c1 = DiscreteFourierTransform(c1, inv)
	for i := 0; i < half; i++ {
		c[i] = c0[i] + w*c1[i]
		c[i+half] = c0[i] - w*c1[i]
		w *= wn
	}
	if inv {
		for i := 0; i < n; i++ {
			c[i] /= 2
		}
	}
	return c
}

func EvalPoly(p []complex128, x complex128) complex128 {
	var r complex128 = 0
	var xpower complex128 = 1
	for _, c := range p {
		r += c * xpower
		xpower *= x
	}
	return r
}

func GetW(k, n int) complex128 {
	return cmplx.Exp(complex(0, float64(k)/float64(n)*math.Pi*2))
}

func MultiplyPolynomials(a, b []float64) []float64 {
	var sza, szb = len(a), len(b)
	if sza == 0 || szb == 0 {
		return []float64{}
	}

	var n int = NextPowerOfTwo(sza + szb - 1)

	var complexCoefA = make([]complex128, n)
	var complexCoefB = make([]complex128, n)
	for i, v := range a {
		complexCoefA[i] = complex(v, 0)
	}
	for i, v := range b {
		complexCoefB[i] = complex(v, 0)
	}
	var expectedPointsA = make([]complex128, n)
	for i := 0; i < n; i++ {
		expectedPointsA[i] = EvalPoly(complexCoefA, GetW(i, n))
	}
	var expectedPointsB = make([]complex128, n)
	for i := 0; i < n; i++ {
		expectedPointsB[i] = EvalPoly(complexCoefB, GetW(i, n))
	}

	var pointsA = DiscreteFourierTransform(complexCoefA, false)
	var pointsB = DiscreteFourierTransform(complexCoefB, false)

	for i := 0; i < n; i++ {
		pointsA[i] *= pointsB[i]
	}

	var r = DiscreteFourierTransform(pointsA, true)

	var ab = make([]float64, sza+szb-1)
	for i := 0; i < len(ab); i++ {
		ab[i] = real(r[i])
	}
	return ab
}

// ---- START TESTING CODE ----

func BruteMultiplication(a, b []float64) []float64 {
	if len(a) == 0 || len(b) == 0 {
		return []float64{}
	}
	var r = make([]float64, len(a)+len(b)-1)
	for i, ai := range a {
		for j, bj := range b {
			r[i+j] += ai * bj
		}
	}
	return r
}

var testCount = 0

func EqualFloat(a, b float64) bool {
	var r = a - b
	if r < 0 {
		r = -r
	}
	return r < 1e-9
}

func RunTest(a, b []float64) {
	testCount++
	var expected = BruteMultiplication(a, b)
	var r = MultiplyPolynomials(a, b)
	var equal = len(r) >= len(expected)
	for i := 0; i < len(expected); i++ {
		equal = equal && EqualFloat(r[i], expected[i])
	}
	for i := len(expected); i < len(r); i++ {
		equal = equal && EqualFloat(r[i], 0)
	}
	fmt.Printf("Test #%d:", testCount)
	if equal {
		fmt.Printf(" OK! (sizes: %d, %d)\n", len(a), len(b))
	} else {
		fmt.Printf(" Wrong Answer\n  A: %v\n  B: %v\n  E: %v\n", a, b, expected)
		fmt.Printf("  R: %v\n", r)
	}
}

func RunFftTests() {
	RunTest([]float64{}, []float64{})
	RunTest([]float64{-3, 1, 23}, []float64{})
	RunTest([]float64{}, []float64{4, 3, 4})
	RunTest([]float64{-3, 1}, []float64{4, 3})
	RunTest([]float64{-3, 1, 2, 5}, []float64{4, 3, -3, 3})
	RunTest([]float64{1, 1, 1, 1, 1, 1}, []float64{1, 1, 1, 1, 1})
	RunTest([]float64{1, 1.4, -2.3, 132.23, -24, -34, 24}, []float64{3, -7.3, 2.3, 4.43, -0.54, -0.345, 12.3})
	RunTest([]float64{1, 1.4, -2.3, 132.23, -24, -34, 24, 12, 13}, []float64{3, -7.3, 2.3, 4.43, -0.54, -0.345, 12.3, 23, 432, 23, -234})
}
