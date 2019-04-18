// Trenton Hohle
// CS 2318-004
// Assignment 02 (Part 02)

#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char procA1Str[] = "processed a1: ";
char commA2Str[] = "          a2: ";
char commA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char reply;
               int used1,
                   used2,
                   used3,
                   target,
                   total,
                   mean,
                   *hopPtr1,
                   *hopPtr2,
                   *hopPtr21,
                   *hopPtr3,
                   *endPtr1,
                   *endPtr2,
                   *endPtr3;

               cout << endl;
               reply = 'y';
               //while (reply != 'n' && reply != 'N')
               goto W1Test;
begW1://               {
                  used1 = 0;
                  used2 = 0;
                  used3 = 0;
                  hopPtr1 = a1;
                  //while (reply != 'n' && reply != 'N')
                  goto W2Test;
begW2://                  {
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
                     //if(used1 < 12)
                     if (used1 >= 12) goto else1;
begI1://                     {
                        cout << emiStr;
                        cin >> reply;
                        goto endI1;

else1://                     else
      //               {
                        cout << moStr << 12 << ieStr << endl;
                        reply = 'N';
endI1://                     }
W2Test:           if(reply != 'n' && reply != 'N') goto begW2;
endW2://                  }

                  cout << endl;

                  //if (used1 > 0)
                  if (used1 <= 0) goto endI2;
begI2://                  {
                     total = 0;
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     goto F1Test;
begF1://                {
                        target = *hopPtr1;
                        total += target;
                        //if (target % 2 == 1)
                        if (target % 2 != 1) goto else3;
begI3://                        {
                           hopPtr3 = a3 + used3 - 1;
                           endPtr3 = a3;
                           //while (hopPtr3 >= endPtr3)
                           goto W3Test;
begW3://                           {
                              //if (*hopPtr3 > target)
                              if (*hopPtr3 <= target) goto else4;
begI4://                              {
                                 *(hopPtr3 + 1) = *hopPtr3;
                                 --hopPtr3;
                                 goto endI4;
//                              }
else4://                              else
//                              {
                                 //break;
                                 goto endW3;
endI4://                        }
W3Test:                    if(hopPtr3 >= endPtr3) goto begW3;
endW3://                          }

                           *(hopPtr3 + 1) = target;
                           ++used3;
                           goto endI3;
//                        }
else3://                        else
//                        {
                           hopPtr2 = a2;
                           endPtr2 = a2 + used2;
                           //while (hopPtr2 < endPtr2)
                           goto W4Test;
begW4://                           {
                              //if (*hopPtr2 >= target)
                              if (*hopPtr2 < target) goto else5;
begI5://                              {
                                 hopPtr21 = endPtr2;
                                 //while (hopPtr21 > hopPtr2)
                                 goto W5Test;
begW5://                                 {
                                    *hopPtr21 = *(hopPtr21 - 1);
                                    --hopPtr21;
W5Test:                          if(hopPtr21 > hopPtr2) goto begW5;
endW5://                                 }

                                 //break;
                                 goto endW4;
                                 goto endI5;
//                              }
else5://                              else
//                              {
                                 ++hopPtr2;
endI5://                              }
W4Test:                    if(hopPtr2 < endPtr2) goto begW4;
endW4://                           }

                           *hopPtr2 = target;
                           ++used2;
endI3://                        }
                        mean = total/used1;
                        ++hopPtr1;
F1Test:              if(hopPtr1 < endPtr1) goto begF1;
endF1://             }


                     cout << begA1Str;
                     //if (used1 > 0)
                     if (used1 <= 0) goto endI6;
begI6://                     {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
//                        do
begDW1://                        {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;

endDW1://                        }
DW1Test:                  if(hopPtr1 < endPtr1) goto begDW1;
//                        while (hopPtr1 < endPtr1);
endI6://                     }
                     cout << endl;

                     cout << commA2Str;
                     //if (used2 > 0)
                     if (used2 <= 0) goto endI7;
begI7://                     {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
//                        do
begDW2://                        {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
endDW2://                        }
                        //while (hopPtr2 < endPtr2);
DW2Test:                if(hopPtr2 < endPtr2) goto begDW2;
endI7://                     }
                     cout << endl;

                     cout << commA3Str;
                     //if (used3 > 0)
                     if (used3 <= 0) goto endI8;
begI8://                    {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
//                        do
begDW3://                        {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
endDW3://                        }
//                      while (hopPtr3 < endPtr3);
DW3Test:                if(hopPtr3 < endPtr3) goto begDW3;
endI8://                    }
                     cout << endl;

                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr2 = a2 + used2;
                     endPtr3 = a3 + used3;
                     //while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
                     goto W6Test;
begW6://                     {
                        //if (*hopPtr2 < *hopPtr3)
                        if (*hopPtr2 >= *hopPtr3) goto else9;
begI9://                        {
                           *hopPtr1 = *hopPtr2;
                           ++hopPtr2;
                           goto endI9;
//                        }
else9://                        else
//                        {
                           *hopPtr1 = *hopPtr3;
                           ++hopPtr3;
endI9://                        }
                        ++hopPtr1;
W6Test:              if(hopPtr2 < endPtr2 && hopPtr3 < endPtr3) goto begW6;
endW6://                     }

                     //while (hopPtr2 < endPtr2)
                     goto W7Test;
begW7://                     {
                        *hopPtr1 = *hopPtr2;
                        ++hopPtr2;
                        ++hopPtr1;
W7Test:              if(hopPtr2 < endPtr2) goto begW7;
endW7://                     }

                     //while (hopPtr3 < endPtr3)
                     goto W8Test;
begW8://                     {
                        *hopPtr1 = *hopPtr3;
                        ++hopPtr3;
                        ++hopPtr1;
W8Test:              if(hopPtr3 < endPtr3) goto begW8;
endW8://                     }


                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     used2 = 0;
                     used3 = 0;
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     goto F2Test;
begF2://                     {
                        target = *hopPtr1;
                        //if (target < mean)
                        if (target >= mean) goto else10;
begI10://                        {
                           *hopPtr2 = target;
                           ++used2;
                           ++hopPtr2;
                           goto endI10;
//                        }
else10://                        else
//                        {
                           //if (target > mean)
                           if (target <= mean) goto endI11;
begI11://                           {
                              *hopPtr3 = target;
                              ++used3;
                              ++hopPtr3;
endI11://                           }
endI10://                        }
                        ++hopPtr1;
F2Test:              if(hopPtr1 < endPtr1) goto begF2;
endF2://                     }


                     cout << procA1Str;
                     //if (used1 > 0)
                     if (used1 <= 0) goto endI12;
begI12://                     {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        //do
begDW4://                        {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
                        //while (hopPtr1 < endPtr1);

endDW4://                        }
DW4Test:             if(hopPtr1 < endPtr1) goto begDW4;
endI12://                     }
                     cout << endl;

                     cout << commA2Str;
                     //if (used2 > 0)
                     if (used2 <= 0) goto endI13;
begI13://                     {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        //do
begDW5://                        {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
                        //while (hopPtr2 < endPtr2);

endDW5://                        }
DW5Test:                if(hopPtr2 < endPtr2) goto begDW5;
endI13://                     }
                     cout << endl;

                     cout << commA3Str;
                     //if (used3 > 0)
                     if (used3 <= 0) goto endI14;
begI14://                     {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        //do
begDW6://                        {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
                        //while (hopPtr3 < endPtr3);

endDW6://                        }
DW6Test:                if(hopPtr3 < endPtr3) goto begDW6;
endI14://                     }
                     cout << endl;
endI2://                  }

                  cout << endl;
                  cout << dacStr;
                  cin >> reply;
                  cout << endl;
W1Test:           if(reply!= 'n' && reply != 'N') goto begW1;
endW1://               }

               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}

