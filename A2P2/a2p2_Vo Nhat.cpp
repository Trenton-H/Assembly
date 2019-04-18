#include <iostream>
using namespace std;

int a1[12],
a2[12],
a3[12];
char einStr[] = "Enter integer #";
char moStr[] = "Max of ";
char ieStr[] = " ints entered...";
char emiStr[] = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[] = "beginning a1: ";
char procA1Str[] = "processed a1: ";
char commA2Str[] = "          a2: ";
char commA3Str[] = "          a3: ";
char dacStr[] = "Do another case? (n or N = no, others = yes) ";
char dlStr[] = "================================";
char byeStr[] = "bye...";

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
	goto WTest1;
begW1:
		used1 = 0;
		used2 = 0;
		used3 = 0;
		hopPtr1 = a1;
		goto WTest2; //while (reply != 'n' && reply != 'N')
		{
			begW2:
			cout << einStr;
			cout << (used1 + 1);
			cout << ':' << ' ';
			cin >> *hopPtr1;
			++used1;
			++hopPtr1;
			if (used1 >= 12) goto else1;
begI1:			//{
				cout << emiStr;
				cin >> reply;
				goto endI1;
			//}
else1:
			//{
				cout << moStr << 12 << ieStr << endl;
				reply = 'N';
			//}
			endI1:;

		}
	WTest2: if (reply != 'n' && reply != 'N') goto begW2;
		cout << endl;

		if (used1 <= 0) goto endI2;  //if (used1 > 0)
begI2:; 
		{
			
			total = 0;
			hopPtr1 = a1;
			endPtr1 = a1 + used1;
			goto fTest1;
			 //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
		begF1: ;
			{
				
				target = *hopPtr1;
				total += target;
				if (!(target % 2 == 1)) goto elseI3;
				{
					hopPtr3 = a3 + used3 - 1;
					endPtr3 = a3;

					//while (hopPtr3 >= endPtr3)
					goto TestW3;
					{
					begW3:;
						if (*hopPtr3 <= target) goto endW3;						
							*(hopPtr3 + 1) = *hopPtr3;
							--hopPtr3;
						
					TestW3:  if (hopPtr3 >= endPtr3) goto begW3;
					}
				endW3:;

					*(hopPtr3 + 1) = target;
					++used3;
					goto endI3;
				}
				elseI3:
				{
					hopPtr2 = a2;
					endPtr2 = a2 + used2;
					//while (hopPtr2 < endPtr2)
					goto testW4;
					{
					begW4:;
						if (*hopPtr2 < target) goto elseI5;
						{
							hopPtr21 = endPtr2;
							//while (hopPtr21 > hopPtr2)
							goto testW5;
							{
								begW5:
								*hopPtr21 = *(hopPtr21 - 1);
								--hopPtr21;
							}
						testW5: if (hopPtr21 > hopPtr2) goto begW5;
							goto b2;
						}
					elseI5:;
						{
							++hopPtr2;
						}
					}
				testW4: if (hopPtr2 < endPtr2) goto begW4;
				b2:;
					*hopPtr2 = target;
					++used2;
				}
			endI3:;
				mean = total / used1;
				++hopPtr1;
			fTest1:     if (hopPtr1 < endPtr1) goto begF1;
			}


			cout << begA1Str;
			if (used1 <= 0) goto endI6;
			{
				hopPtr1 = a1;
				endPtr1 = a1 + used1;
				DW1:
				{
					cout << *hopPtr1 << ' ' << ' ';
					++hopPtr1;
				}if (hopPtr1 < endPtr1) goto DW1; // while (hopPtr1 < endPtr1);
			}
			endI6:
			cout << endl;

			cout << commA2Str;
			if (used2 <= 0) goto endI7;
			{
				hopPtr2 = a2;
				endPtr2 = a2 + used2;
				DW2:
				{
					cout << *hopPtr2 << ' ' << ' ';
					++hopPtr2;
				} if (hopPtr2 < endPtr2) goto DW2;
			}
			endI7:
			cout << endl;

			cout << commA3Str;
			if (used3 <= 0) goto endI8;
			{
				hopPtr3 = a3;
				endPtr3 = a3 + used3;
				DW3:
				{
					cout << *hopPtr3 << ' ' << ' ';
					++hopPtr3;
				}if (hopPtr3 < endPtr3) goto DW3;
			}
			endI8:
			cout << endl;

			hopPtr1 = a1;
			hopPtr2 = a2;
			hopPtr3 = a3;
			endPtr2 = a2 + used2;
			endPtr3 = a3 + used3;
			// while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
			goto testW6;
			{
				startW6:
				if (*hopPtr2 >= *hopPtr3) goto elseI9;
				{
					*hopPtr1 = *hopPtr2;
					++hopPtr2;
					goto endI9;
				}
				elseI9:
				{
					*hopPtr1 = *hopPtr3;
					++hopPtr3;
				}
				endI9:
				++hopPtr1;
			}
		testW6: if (hopPtr2 < endPtr2 && hopPtr3 < endPtr3) goto startW6;

			goto testW7;//while (hopPtr2 < endPtr2)
			{
				begW7:
				*hopPtr1 = *hopPtr2;
				++hopPtr2;
				++hopPtr1;
			}
		testW7: if(hopPtr2 < endPtr2) goto begW7;
			goto testW8;// while (hopPtr3 < endPtr3)
			{
			begW8:			
				*hopPtr1 = *hopPtr3;
				++hopPtr3;
				++hopPtr1;
			}
		testW8: if (hopPtr3 < endPtr3) goto begW8;

			hopPtr2 = a2;
			hopPtr3 = a3;
			used2 = 0;
			used3 = 0;
			//for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
			hopPtr1 = a1; endPtr1 = a1 + used1;
			goto testF2;
			begF2:
			{
				target = *hopPtr1;
				if (target >= mean) goto elseI10;
				//{
					*hopPtr2 = target;
					++used2;
					++hopPtr2;
					goto endI10;
				//}
				elseI10:
				//{
					if (target <= mean) goto endI10;
					//{
						*hopPtr3 = target;
						++used3;
						++hopPtr3;
					//}
				//}
			endI10:;
			}
			++hopPtr1;
		testF2:if (hopPtr1 < endPtr1) goto begF2;

			cout << procA1Str;
			if (!(used1 > 0)) goto endI12;
			{
				hopPtr1 = a1;
				endPtr1 = a1 + used1;
			DW4:;// do
				{
					cout << *hopPtr1 << ' ' << ' ';
					++hopPtr1;
				} if (hopPtr1 < endPtr1) goto DW4;
			}
			endI12:
			cout << endl;

			cout << commA2Str;
			if (!(used2 > 0)) goto endI13;
			{
				hopPtr2 = a2;
				endPtr2 = a2 + used2;
				DW5:
				{
					cout << *hopPtr2 << ' ' << ' ';
					++hopPtr2;
				} if (hopPtr2 < endPtr2) goto DW5;
			}
			endI13:
			cout << endl;

			cout << commA3Str;
			if (!(used3 > 0)) goto endI4;
			{
				hopPtr3 = a3;
				endPtr3 = a3 + used3;
				DW6:
				{
					cout << *hopPtr3 << ' ' << ' ';
					++hopPtr3;
				} if(hopPtr3 < endPtr3) goto DW6;
			}
			endI4:
			cout << endl;
		}
endI2:
		cout << endl;
		cout << dacStr;
		cin >> reply;
		cout << endl;
WTest1:  if (reply != 'n' && reply != 'N') goto begW1;

 

	cout << dlStr << '\n';
	cout << byeStr << '\n';
	cout << dlStr << '\n';

	return 0;
}

