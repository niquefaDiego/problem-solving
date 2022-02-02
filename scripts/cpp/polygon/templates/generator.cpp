/**
 * Sample validator for the a+b problem. More about testlib.h generators in:
 * - https://codeforces.com/blog/entry/18291
 * - https://github.com/MikeMirzayanov/testlib
 */
#include "testlib.h"

using namespace std;

int main(int argc, char* argv[]) {
  registerGen(argc, argv, 1);

  int a = rnd.next(1, 100);
  int b = rnd.next(1, 100);
  printf("%d %d\n", a, b);
}
