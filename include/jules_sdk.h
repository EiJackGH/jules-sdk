#ifndef JULES_SDK_H
#define JULES_SDK_H

#include <string>

namespace jules {

/**
 * @brief The main SDK class for Jules.
 */
class SDK {
public:
    SDK();
    ~SDK();

    /**
     * @brief Initializes the SDK.
     */
    void initialize();

    /**
     * @brief Shuts down the SDK.
     */
    void shutdown();

    /**
     * @brief Logs a message through the SDK.
     * @param message The message to log.
     */
    void log(const std::string& message);

    /**
     * @brief Get the SDK version.
     * @return Version string.
     */
    std::string getVersion() const;

private:
    bool m_initialized;
};

} // namespace jules

#endif // JULES_SDK_H
