package main

type SegTree struct {
	left  *SegTree
	right *SegTree
	fr    int
	to    int
	sum   int
}

func NewSegTree(fr, to int) *SegTree {
	var r = SegTree{
		fr: fr,
		to: to,
	}
	if fr != to {
		r.left = NewSegTree(fr, (fr+to)/2)
		r.right = NewSegTree((fr+to)/2+1, to)
	}
	return &r
}

func (s *SegTree) Refresh() {
	s.sum = s.left.sum + s.right.sum
}

func (s *SegTree) Update(i, v int) {
	if s.fr == s.to {
		s.sum = v
		return
	}
	if i <= s.left.to {
		s.left.Update(i, v)
	} else {
		s.right.Update(i, v)
	}
	s.Refresh()
}

func (s *SegTree) Query(a, b int) int {
	if s.fr == a && s.to == b {
		return s.sum
	}
	if s.left.to >= b {
		return s.left.Query(a, b)
	}
	if s.right.fr <= a {
		return s.right.Query(a, b)
	}
	return s.left.Query(a, s.left.to) + s.right.Query(s.right.fr, b)
}
