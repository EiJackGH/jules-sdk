#include "jules_sdk.h"
#include <iostream>

int main() {
    jules::SDK sdk;

    std::cout << "Test App: SDK Version " << sdk.getVersion() << std::endl;

    // Try to log before initialization (should fail)
    sdk.log("This should fail.");

    sdk.initialize();

    sdk.log("Hello, Jules SDK!");
    sdk.log("This is a test message from the example app.");

    sdk.shutdown();

    return 0;
}
