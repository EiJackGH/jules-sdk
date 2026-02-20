#include "jules_sdk.h"
#include <iostream>

namespace jules {

SDK::SDK() : m_initialized(false) {}

SDK::~SDK() {
    if (m_initialized) {
        shutdown();
    }
}

void SDK::initialize() {
    if (!m_initialized) {
        std::cout << "[Jules SDK] Initializing..." << std::endl;
        m_initialized = true;
        std::cout << "[Jules SDK] SDK initialized." << std::endl;
    }
}

void SDK::shutdown() {
    if (m_initialized) {
        std::cout << "[Jules SDK] Shutting down..." << std::endl;
        m_initialized = false;
        std::cout << "[Jules SDK] SDK shut down." << std::endl;
    }
}

void SDK::log(const std::string& message) {
    if (m_initialized) {
        std::cout << "[Jules SDK LOG] " << message << std::endl;
    } else {
        std::cerr << "[Jules SDK ERROR] SDK not initialized. Cannot log message: " << message << std::endl;
    }
}

std::string SDK::getVersion() const {
    return "1.0.0";
}

} // namespace jules
