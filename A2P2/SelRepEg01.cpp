#include <iostream>
using namespace std;

int iArr[10];
int oneInt,
    used,
    minInt,
    maxInt;
char reply;
bool hasDup;
int* hopPtr1;
int* hopPtr2;
int* endPtr1;
int* endPtr2;

int main()
{
                 do
                 {
                    used = 0;
                    hopPtr1 = iArr;
                    do
                    {
                       cout << "Enter integer #" << (used + 1) << ": ";
                       cin >> oneInt;
                       /* if ( (oneInt % 2) != 0 ) */
                       if ( (oneInt & 1) != 0 )
                       {
                          cout << "Odd value entered... 1 added to evenize..." << endl;
                          ++oneInt;
                       }
                       *hopPtr1 = oneInt;
                       ++used;
                       ++hopPtr1;
                       if (used == 10)
                       {
                          cout << "Maximum of " << 10 << " values entered..." << endl;
                          reply = 'n';
                       }
                       else
                       {
                          cout << "Enter another? (n or N = no, anything else = yes) ";
                          cin >> reply;
                       }
                    }
                    while (reply != 'n' && reply != 'N');
                    cout << endl;

                    cout << used << " values entered: ";
                    endPtr1 = iArr + used;
                    for (hopPtr1 = iArr; hopPtr1 < endPtr1; ++hopPtr1)
                    {
                       if (hopPtr1 < endPtr1 - 1)
                       {
                          cout << *hopPtr1 << "  ";
                       }
                       else
                       {
                          cout << *hopPtr1 << endl;
                       }
                    }
                    hopPtr1 = iArr;
                    endPtr1 = iArr + used;
                    minInt = *iArr;
                    maxInt = minInt;
                    ++hopPtr1;
                    while (hopPtr1 < endPtr1)
                    {
                       if (*hopPtr1 < minInt)
                       {
                          minInt = *hopPtr1;
                       }
                       else
                       {
                          if (*hopPtr1 > maxInt)
                          {
                             maxInt = *hopPtr1;
                          }
                       }
                       ++hopPtr1;
                    }
                    cout << "Minimum is " << minInt << endl;
                    cout << "Maximum is " << maxInt << endl;
                    hasDup = false;
                    endPtr1 = iArr + used - 1;
                    endPtr2 = iArr + used;
                    for (hopPtr1 = iArr; !hasDup && hopPtr1 < endPtr1; ++hopPtr1)
                    {
                       oneInt = *hopPtr1;
                       for (hopPtr2 = hopPtr1 + 1; hopPtr2 < endPtr2; ++hopPtr2)
                       {
                          if (*hopPtr2 == oneInt)
                          {
                             hasDup = true;
                             break;
                          }
                       }
                    }
                    if (hasDup)
                    {
                       cout << "There's at least a duplicate..." << endl;
                    }
                    else
                    {
                       cout << "There's no duplicate..." << endl;
                    }

                    cout << "Do another case? (n or N = no, others = yes) ";
                    cin >> reply;
                 }
                 while (reply != 'n' && reply != 'N');

                 return 0;
}
