/**
 * Sample validator for the a+b problem. More about testlib.h validators in:
 * - https://codeforces.com/blog/entry/18426
 * - https://github.com/MikeMirzayanov/testlib
 */
#include "testlib.h"

using namespace std;

int main(int argc, char* argv[])
{
  registerValidation(argc, argv);

  int a = inf.readInt(1, 100, "a");
  inf.readSpace();
  int b = inf.readInt(1, 100, "b");
  inf.readEoln();
  inf.readEof();
}