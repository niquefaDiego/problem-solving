package main

type DisjointSet struct {
	p []int
	r []int
}

func (dset *DisjointSet) root(a int) int {
	if dset.p[a] != a {
		dset.p[a] = dset.root(dset.p[a])
	}
	return dset.p[a]
}

func (dset *DisjointSet) join(a, b int) {
	a = dset.root(a)
	b = dset.root(b)
	if a == b {
		return
	}
	if dset.r[a] > dset.r[b] {
		dset.p[b] = a
	} else {
		dset.p[a] = b
		if dset.r[a] == dset.r[b] {
			dset.r[b]++
		}
	}
}

func (dset *DisjointSet) clear() {
	n := len(dset.p)
	for i := 0; i < n; i++ {
		dset.r[i] = 0
		dset.p[i] = i
	}
}

func newDisjoinSet(n int) *DisjointSet {
	r := &DisjointSet{
		p: make([]int, n),
		r: make([]int, n),
	}
	for i := 0; i < n; i++ {
		r.p[i] = i
	}
	return r
}

func TestDisjointSet() {
	assert := func(f bool) {
		if !f {
			panic("assertion failed")
		}
	}
	dset := newDisjoinSet(5)
	dset.join(0, 1)
	dset.join(2, 3)
	assert(dset.root(0) != dset.root(2))
	dset.clear()
}
