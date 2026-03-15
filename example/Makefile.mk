-include Config.mk

NAME_MODULE = $(EXAMPLE_DIR)/example
NAME_STATIC_MODULE = libak.a

OBJ += 	$(EXAMPLE_DIR)/main.o \
		$(EXAMPLE_DIR)/task_list.o \
		$(EXAMPLE_DIR)/task_1.o \
		$(EXAMPLE_DIR)/task_2.o  \
		$(EXAMPLE_DIR)/task_3.o

CFLAGS  += -I./$(EXAMPLE_DIR)
CFLAGS  += -I/mnt/local/include
CFLAGS	+= -I/usr/local/include
CFLAGS	+= -I/usr/include



LDFLAGS += -L/mnt/local/lib -Wl
LDFLAGS += -L/usr/local/lib
LDLIBS  += -lak \
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
	@$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS) $(LDLIBS)

$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK EXAMPLE ----------
	@echo CC 	$^ -o $@
	@$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(LDLIBS)
	
clean:
	@echo rm -rf $(EXAMPLE_DIR)/$(OBJ)
	@rm -rf $(OBJ)
	@rm -rf $(NAME_MODULE)