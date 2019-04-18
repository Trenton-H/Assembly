#include <iostream>
using namespace std;

int SumArray(int a[], int size);
int Sum2Arrays(int a1[], int size1, int a2[], int size2);
int Sum3Arrays(int a1[], int size1, int a2[], int size2, int a3[], int size3);

int main()
{
            int a1[2] = {11, 12},
                a2[3] = {21, 22, 23},
                a3[4] = {31, 32, 33, 34};
            char outLabel[] = "3-array sum = ";

            cout << outLabel;
            cout << Sum3Arrays(a1, 2, a2, 3, a3, 4);
            cout << endl;

            return 0;
}

int SumArray(int a[], int size)
{
            int sum, i;
            sum = 0;
            i = 0;
            goto forTest;
begFor:
            sum = sum + a[i];
            ++i;
forTest:
            if (i < size) goto begFor;
            return sum;
}
////////////////////
// non-goto version:
////////////////////
// int SumArray(int a[], int size)
// {
//             int sum, i;
//             sum = 0;
//             for (i = 0; i < size; ++i)
//                sum = sum + a[i];
//             return sum;
// }
////////////////////

int Sum2Arrays(int a1[], int size1, int a2[], int size2)
{
            int sum1, sum2, sum12, i;

            sum1 = 0;
            i = 0;
            goto forTest1;
begFor1:
            sum1 = sum1 + a1[i];
            ++i;
forTest1:
            if (i < size1) goto begFor1;

            sum2 = 0;
            i = 0;
            goto forTest2;
begFor2:
            sum2 = sum2 + a2[i];
            ++i;
forTest2:
            if (i < size2) goto begFor2;

            sum12 = sum1 + sum2;
            return sum12;
}
////////////////////
// non-goto version:
////////////////////
// int Sum2Arrays(int a1[], int size1, int a2[], int size2)
// {
//             int sum1, sum2, sum12, i;
//
//             sum1 = 0;
//             for (i = 0; i < size1; ++i)
//                sum1 = sum1 + a1[i];
//
//             sum2 = 0;
//             for (i = 0; i < size2; ++i)
//                sum2 = sum2 + a2[i];
//
//             sum12 = sum1 + sum2;
//             return sum12;
// }
////////////////////

int Sum3Arrays(int a1[], int size1, int a2[], int size2, int a3[], int size3)
{
            int sum12, sum3, sum123;
            sum3 = SumArray(a3, size3);
            sum12 = Sum2Arrays(a1, size1, a2, size2);
            sum123 = sum12 + sum3;
            return sum123;
}

