-include Config.mk

NAME_MODULE = $(EXAMPLE_DIR)/example
# NAME_STATIC_MODULE = libak.a

OBJ += 	$(EXAMPLE_DIR)/main.o \
		$(EXAMPLE_DIR)/task_list.o \
		$(EXAMPLE_DIR)/task_1.o \
		$(EXAMPLE_DIR)/task_2.o 

CFLAGS += -I$(PREFIX)/include/
LDFLAGS += -L$(PREFIX)/lib
LDLIBS += -lak

all: $(NAME_MODULE)

$(EXAMPLE_DIR)/%.o: %.c
	@echo CC 	$<
	@$(CC) $(CFLAGS) -c -o $@ $<

$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK EXAMPLE ----------
	@echo CC 	$^ -o $@
	@$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)
	
clean:
	@echo rm -rf $(EXAMPLE_DIR)/$(OBJ)
	@rm -rf $(OBJ)
	@rm -rf $(NAME_MODULE)