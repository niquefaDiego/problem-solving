package main

import (
	"fmt"
	"strconv"
)

type DequeItem = int

type Deque struct {
	first    int
	size     int
	capacity int
	values   *[]DequeItem
}

func NewDeque() Deque {
	return Deque{
		first:    0,
		size:     0,
		capacity: 0,
		values:   &[]DequeItem{},
	}
}

func (d *Deque) Grow() {
	d.SetCapacity((d.capacity + 1) * 2)
}

func (d *Deque) SetCapacity(newCapacity int) {
	var newValues = make([]DequeItem, newCapacity)
	for i := 0; i < d.size; i += 1 {
		newValues[i] = d.Get(i)
	}
	d.first = 0
	d.capacity = newCapacity
	d.values = &newValues
}

func (d *Deque) Get(i int) DequeItem {
	return (*d.values)[(d.first+i)%d.capacity]
}

func (d *Deque) PushRight(x DequeItem) {
	if d.size == d.capacity {
		d.Grow()
	}
	(*d.values)[(d.first+d.size)%d.capacity] = x
	d.size++
}

func (d *Deque) PushLeft(x DequeItem) {
	if d.size == d.capacity {
		d.Grow()
	}
	d.first = (d.first + d.capacity - 1) % d.capacity
	(*d.values)[d.first] = x
	d.size++
}

func (d *Deque) PopRight() {
	d.size--
}

func (d *Deque) PopLeft() {
	d.first = (d.first + 1) % d.capacity
	d.size--
}

func (d *Deque) Left() DequeItem {
	return (*d.values)[d.first]
}

func (d *Deque) Right() DequeItem {
	return d.Get(d.size - 1)
}

func (d *Deque) ToString() string {
	var s string = ""
	for i := 0; i < d.size; i += 1 {
		s += strconv.Itoa(d.Get(i)) + " "
	}
	return fmt.Sprintf("{ values: [%s] first=%d, size=%d, capacity=%d }", s, d.first, d.size, d.capacity)
}

func TestDeque() {
	var d = NewDeque()
	fmt.Println(d.ToString())
	d.PushRight(1)
	fmt.Println(d.ToString())
	d.PushRight(5)
	fmt.Println(d.ToString())
	d.PushRight(2)
	fmt.Println(d.ToString())
	d.PushRight(3)
	fmt.Println(d.ToString())
	d.PushRight(6)
	fmt.Println(d.ToString())
	d.PushRight(10)
	fmt.Println(d.ToString())
	d.PopRight()
	fmt.Println(d.ToString())
	d.PushLeft(-1)
	fmt.Println(d.ToString())
	d.PushLeft(-3)
	fmt.Println(d.ToString())
}
