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
    ACCELERATING,
    BREAKING
};

#define MAX_NAME_LENGTH 12

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
void startEngine(struct Vehicle aVehicle);


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
    struct Vehicle janeCar;
    janeCar.status = IDLE;
    strncpy(janeCar.ownerName, "Jane", MAX_NAME_LENGTH);

    struct Vehicle jackCar;
    jackCar.status = IDLE;
    strncpy(jackCar.ownerName, "Jack", MAX_NAME_LENGTH);

    struct Vehicle myCar;
    myCar.status = IDLE;
    myCar.ownerName[0] = '\0'; // No owner name


    // Test Jane's Car
    startEngine(janeCar);
    accelerate(janeCar);
    brake(janeCar);
    printf("\n");

    // Test Jack's Car
    startEngine(jackCar);
    accelerate(jackCar);
    brake(jackCar);
    printf("\n");

    // Test My Car (matches output from template.cpp)
    startEngine(myCar);
    accelerate(myCar);
    brake(myCar);

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
        case ACCELERATING:
            printf("Status: ACCELERATING\n");
            break;
        case BREAKING:
            printf("Status: BREAKING\n");
            break;
        default:
            printf("Status: UNKNOWN\n");
            break;
    }
}


void startEngine(struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("%s's car: ", aVehicle.ownerName);
    }

    aVehicle.status = STARTING;
    printf("Engine started!\n");
}


void accelerate(struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("%s's car: ", aVehicle.ownerName);
    }

    aVehicle.status = ACCELERATING;
    printf("Car: Pressing gas pedal...\n");
}


void brake(struct Vehicle aVehicle) {
    if (aVehicle.ownerName[0] != '\0') {
        printf("%s's car: ", aVehicle.ownerName);
    }

    aVehicle.status = BREAKING;
    printf("Car: Applying brakes...\n");
}