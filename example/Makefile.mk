-include Config.mk

NAME_MODULE = $(EXAMPLE_DIR)/example
NAME_STATIC_MODULE = libak.a

OBJ += 	$(EXAMPLE_DIR)/main.o \
		$(EXAMPLE_DIR)/task_list.o \
		$(EXAMPLE_DIR)/task_1.o \
		$(EXAMPLE_DIR)/task_2.o  \
		$(EXAMPLE_DIR)/task_3.o

CXXFLAGS  += -I./$(EXAMPLE_DIR)
CXXFLAGS  += -I/mnt/local/include
CXXFLAGS	+= -I/usr/local/include
CXXFLAGS	+= -I/usr/include

# CXXFLAGS += CFLAGS

LDFLAGS += -L/mnt/local/lib
LDFLAGS += -L/usr/local/lib
LDLIBS  +=  -lak \
			-lraylib \
			-lm \
			-lX11 \
			-lGL \
			-ldl \
			-lpthread \
			-lrt
			


# LDFLAGS += -L/usr/local/lib
# LDFLAGS  += -lraylib
# LDFLAGS += -L/usr/include


all: $(NAME_MODULE)

$(EXAMPLE_DIR)/%.o: %.c
	@echo CC 	$<
	@$(CC) -c -o $@ $< $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)

$(EXAMPLE_DIR)/%.o: %.cpp
	@echo CC 	$<
	@$(CXX) -c -o $@ $< $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)

$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK EXAMPLE ----------
	@echo CC 	$^ -o $@
	@$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)
	
clean:
	@echo rm -rf $(EXAMPLE_DIR)/$(OBJ)
	@rm -rf $(OBJ)
	@rm -rf $(NAME_MODULE)


# LD_LIBRARY_PATH=/mnt/local/lib ./example/example