-include Config.mk
include common/Makefile.mk
NAME_MODULE = $(EXAMPLE_DIR)/example
# NAME_STATIC_MODULE = libak.a

# OBJ += 	$(EXAMPLE_DIR)/main.o \
# 		$(EXAMPLE_DIR)/task_list.o \
# 		$(EXAMPLE_DIR)/task_1.o \
# 		$(EXAMPLE_DIR)/task_2.o  \
# 		$(EXAMPLE_DIR)/task_3.o \
# 		$(EXAMPLE_DIR)/if_console.o \
# 		$(EXAMPLE_DIR)/task_console.o \
# 		$(EXAMPLE_DIR)/shell.o

SRC += $(EXAMPLE_DIR)/main.c \
       $(EXAMPLE_DIR)/task_list.c \
       $(EXAMPLE_DIR)/task_1.c \
       $(EXAMPLE_DIR)/task_2.c \
       $(EXAMPLE_DIR)/task_3.c \
       $(EXAMPLE_DIR)/if_console.c \
       $(EXAMPLE_DIR)/task_console.c \
       $(EXAMPLE_DIR)/shell.c \
	   $(EXAMPLE_DIR)/if_put_console.c 
# 	   $(EXAMPLE_DIR)/cmd_line.c
# 	   common/cmd_line.c

OBJ += $(patsubst $(EXAMPLE_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))
# OBJ := $(patsubst %.c,$(OBJ_DIR)/%.o,$(notdir $(SRC)))

# CXXFLAGS	+= -I./ak
CFLAGS  	+= -I./example
CFLAGS  	+= -I/mnt/local/include
CFLAGS	+= -I/usr/local/include
CFLAGS	+= -I/usr/include

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

$(OBJ_DIR)/%.o: $(EXAMPLE_DIR)/%.c
	@echo CC $<
	@mkdir -p $(OBJ_DIR)
	@$(CC) -c $< -o $@ $(CFLAGS)

$(OBJ_DIR)/%.o: common/%.c
	@echo CC $<
	@mkdir -p $(OBJ_DIR)
	@$(CC) -c $< -o $@ $(CFLAGS)

# $(OBJ_DIR)/%o: %c
# 	@echo CC 	$<
# 	@$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS) $(LDLIBS)	

$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK EXAMPLE ----------
	@echo CC 	$^ -o $@
	@$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(LDLIBS)
	
clean:
	@echo rm -rf $(EXAMPLE_DIR)/$(OBJ)
	@rm -rf $(OBJ)
	@rm -rf $(NAME_MODULE)


# LD_LIBRARY_PATH=/mnt/local/lib ./example/example