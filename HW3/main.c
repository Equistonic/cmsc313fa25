// Includes
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


///////////////////////////////////////////////////////////////
//                    Function Prototypes                    //
///////////////////////////////////////////////////////////////

// Name:           matmult()
// Desc:           Multiplies two 3x3 matrixes, first and second, and stores the
//                 result in the passed 3x3 result matrix argument
// Preconditions:  result, first, and second are initialized 3x3 int arrays
// Postconditions: The matrix multiplication of first*second is stored in result
void matmult(int result[3][3], int first[3][3], int second[3][3]);


// Name:           matadd()
// Desc:           Adds two 3x3 matrixes, first and second, and stores the
//                 result in the passed 3x3 result matrix argument
// Preconditions:  result, first, and second are initialized 3x3 int arrays
// Postconditions: The matrix addition of first*second is stored in result
void matadd(int result[3][3], int first[3][3], int second[3][3]);


// Name:           clearResult()
// Desc:           Resets the result matrix to all 0's
// Preconditions:  result is an initialized 3x3 int array
// Postconditions: The result matrix is set to all 0's
void clearResult(int result[3][3]);


// Name:           printMatrix()
// Desc:           Prints a given matrix out to the console in a specified
//                 format
// Preconditions:  matrix is an initialized 3x3 int array
// Postconditions: The matrix array is printed to the console
void printMatrix(int matrix[3][3], const char* varName, bool printVarName);


///////////////////////////////////////////////////////////////
//                       Program Entry                       //
///////////////////////////////////////////////////////////////

int main() {
    int A[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int B[3][3] = {{1, 2, 0}, {3, 4, 5}, {0, 6, 7}};
    int result[3][3] = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}; // init to 0

    printMatrix(A, "A", true);
    printMatrix(B, "B", true);
    
    // A*B+A

    // AB first
    matmult(result, A, B);
    int AB[3][3];
    memcpy(AB, result, sizeof(AB)); // copy result to AB

    // add A
    matadd(result, AB, A);

    printMatrix(result, "A*B+A", true);
    
    return 0;
}


///////////////////////////////////////////////////////////////
//                 Function Implementations                  //
///////////////////////////////////////////////////////////////

void matmult(int result[3][3], int first[3][3], int second[3][3]) {
    clearResult(result);

    // triple loop to get proper multiplication O(n^3)
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            for (int k = 0; k < 3; k++) {
                result[i][j] += first[i][k] * second[k][j];
            }
        }
    }
}


void matadd(int result[3][3], int first[3][3], int second[3][3]) {
    clearResult(result);

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            result[i][j] = first[i][j] + second[i][j];
        }
    }
}


void clearResult(int result[3][3]) {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            result[i][j] = 0;
        }
    }
}


void printMatrix(int matrix[3][3], const char* varName, bool printVarName) {
    // padding so every number lines up evenly
    int padding = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int numDigits = (matrix[i][j] == 0) ? 1 : 0;
            int temp = abs(matrix[i][j]);
            while (temp > 0) {
                numDigits++;
                temp /= 10;
            }
            if (matrix[i][j] < 0) {
                numDigits++; // account for negative sign
            }
            if (numDigits > padding) {
                padding = numDigits;
            }
        }
    }

    // print the matrix
    for (int i = 0; i < 3; i++) {
        // print var name (before lines) (optional)
        if (printVarName && strlen(varName) != 0 && i == 1) {
            printf("%s = ", varName);
        }
        
        bool notMiddle = (i == 0 ) || (i == 2);
        if (notMiddle && printVarName && strlen(varName) != 0) {
            // align with var name if printed
            printf("   "); // same length as " = "
            for (int i = 0; i < strlen(varName); i++) {
                printf(" ");
            }
        }

        printf(notMiddle ? "[" : "|");

        // print numbers loop
        for (int j = 0; j < 3; j++) {
            printf(" %d", matrix[i][j]); // print num
            
            // get #/digits in current number, add padding-#/digits
            int numDigits;
            if (matrix[i][j] == 0) {
                numDigits = 1;
            } else {
                numDigits = 0;
                int temp = abs(matrix[i][j]);
                while (temp > 0) {
                    numDigits++;
                    temp /= 10;
                }
                if (matrix[i][j] < 0) {
                    numDigits++; // account for negative sign
                }
            }

            // padding
            for (int k = 0; k < padding - numDigits; k++) {
                printf(" ");
            }
        }

        printf(notMiddle ? " ]\n" : " |\n");
    }
}