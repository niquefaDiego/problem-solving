package main

import "container/heap"

type Pair struct {
	value int
	i     int
	j     int
}

func NewPair(i, j, value int) Pair {
	return Pair{
		value: value,
		i:     i,
		j:     j,
	}
}

type PairHeap []Pair

func (h PairHeap) Len() int {
	return len(h)
}
func (h PairHeap) Less(i, j int) bool {
	return h[i].value < h[j].value
}
func (h PairHeap) Swap(i, j int) {
	h[i], h[j] = h[j], h[i]
}

func (h *PairHeap) Push(x interface{}) {
	*h = append(*h, x.(Pair))
}

func (h *PairHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[0 : n-1]
	return x
}

func (h PairHeap) Peek() interface{} {
	return h[len(h)-1]
}

func TestHeap() {
	var h PairHeap
	heap.Init(&h)
	heap.Push(&h, NewPair(1, 2, 100))
	heap.Push(&h, NewPair(1, 3, 200))
	top := heap.Pop(&h).(Pair)
	if top.value != 100 {
		panic("Heap top should be 100")
	}
	if h.Len() != 1 {
		panic("Heap should have 1 element")
	}
}
