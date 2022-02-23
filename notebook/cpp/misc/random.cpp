
unsigned int g_seed = 1000000021;
const unsigned int FASTRAND_MAX = 0x7FFF;
inline int fastrand() {
    g_seed = (214013*g_seed+2531011);
	return (g_seed>>16)&0x7FFF;
}

template<class T>
void premutateRandom(vector<T>& v) {
  for (int i = 1; i < int(v.size()); i++) {
    swap(v[i], v[fastrand()%i]);
  }
}
