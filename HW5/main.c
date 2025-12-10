///////////////////////////////////////////////////////////////
//                         Includes                          //
///////////////////////////////////////////////////////////////
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

enum STATUS {
    IDLE,
    STARTING,
    GAS,
    BREAKING
};

const int MAX_NAME_LENGTH = 12;

struct Vehicle {
    enum STATUS status;
    char ownerName[MAX_NAME_LENGTH];
};


///////////////////////////////////////////////////////////////
//                    Function Prototypes                    //
///////////////////////////////////////////////////////////////

// Name: printStatus
// Desc: Prints the current status based on the enum STATUS value
// Preconditions: status is a valid enum STATUS value
// Postconditions: None
void printStatus(const struct Vehicle aVehicle); 


// Name: startEngine
// Desc: Prints "Engine started!" to the console
// Preconditions: None
// Postconditions: None
void startEngine(const struct Vehicle aVehicle);


// Name: accelerate
// Desc: Prints "Car: Pressing gas pedal..." to the console
// Preconditions: None
// Postconditions: None
void accelerate(struct Vehicle aVehicle);


// Name: brake
// Desc: Prints "Car: Applying brakes..." to the console
// Preconditions: None
// Postconditions: None
void brake(struct Vehicle aVehicle);


///////////////////////////////////////////////////////////////
//                       Program Entry                       //
///////////////////////////////////////////////////////////////
int main() {
    // Create Vehicle object
    struct Vehicle myCar;

    return 0;
}

///////////////////////////////////////////////////////////////
//                   Function Definitions                    //
///////////////////////////////////////////////////////////////
void printStatus(const struct Vehicle aVehicle) {
    switch (aVehicle.status) {
        case IDLE:
            printf("Status: IDLE\n");
            break;
        case STARTING:
            printf("Status: STARTING\n");
            break;
        case GAS:
            printf("Status: GAS\n");
            break;
        case BREAKING:
            printf("Status: BREAKING\n");
            break;
        default:
            printf("Status: UNKNOWN\n");
            break;
    }
}


void startEngine(const struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("Owner: %s's car: ", aVehicle.ownerName);
    }

    printf("Engine started!\n");
}


void accelerate(struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("Owner: %s's car: ", aVehicle.ownerName);
    }

    printf("Car: Pressing gas pedal...\n");
}


void brake(struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("Owner: %s's car: ", aVehicle.ownerName);
    }

    printf("Car: Applying brakes...\n");
}