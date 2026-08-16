# ==========================================
# Jules SDK Build System
# ==========================================

# Compiler and Flags
CXX      := g++
INC_DIR  := include
CXXFLAGS := -std=c++17 -Wall -Wextra -I$(INC_DIR)
LDFLAGS  := -Llib
LDLIBS   := -lm

# Directories
SRC_DIR     := src
OBJ_DIR     := obj
BIN_DIR     := bin
EXAMPLE_DIR := examples

# Target Name
TARGET   := $(BIN_DIR)/libjules_sdk.a
TEST_APP := $(BIN_DIR)/test_app

# Find all source files and map them to object files
SRCS     := $(wildcard $(SRC_DIR)/*.cpp)
OBJS     := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

# --- Rules ---

.PHONY: all clean install directories examples

all: directories $(TARGET)

examples: $(TEST_APP)

# Create a static library (Common for SDKs)
$(TARGET): $(OBJS)
	ar rcs $@ $^
	@echo "Successfully built Jules SDK: $@"

# Compile source files into objects
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile example application
$(TEST_APP): $(EXAMPLE_DIR)/test_app.cpp $(TARGET)
	$(CXX) $(CXXFLAGS) $< -o $@ $(TARGET)
	@echo "Successfully built Test Application: $@"

# Create necessary directories
directories:
	@mkdir -p $(OBJ_DIR) $(BIN_DIR)

# Clean build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned build artifacts."

# Install headers and library (Adjust prefix as needed)
PREFIX := /usr/local
install: all
	install -d $(PREFIX)/include/jules
	install -m 644 $(INC_DIR)/*.h $(PREFIX)/include/jules
	install -m 644 $(TARGET) $(PREFIX)/lib
	@echo "Jules SDK installed to $(PREFIX)"
