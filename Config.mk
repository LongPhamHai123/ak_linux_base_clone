# edit these lines for cross flatform
CROSS_PREFIX = 
PREFIX = /mnt/local
CC = $(CROSS_PREFIX)gcc
AR = $(CROSS_PREFIX)ar
CXX = $(CROSS_PREFIX)g++
# input version compiler
VERSION = 1
STD = gnu99

# input DIR
ROOT_DIR = $(shell pwd)
OBJ_DIR = build
HEADER_DIR = ak
EXAMPLE_DIR = example
SRC_DIR = src

# input FLAGS
LDFLAGS += -lpthread -lrt
CFLAGS += -I./ -std=$(STD) -fPIC -finline-functions -w -pipe -fPIC -fwrapv -fdata-sections -ffunction-sections -O2
# CFFLAGS += -I./ -std=$(STD) -fPIC -finline-functions -w -pipe -fwrapv -fdata-sections -ffunction-sections -O2

OPTIMIZE_OPTION	+=	-g -O3
WARNNING_OPTION	+=	-Werror -W -Wno-missing-field-initializers

# CXXFLAGS	+=	$(OPTIMIZE_OPTION)	\
# 			$(WARNNING_OPTION)	\
# 			-std=c++11		\
# 			-Wall			\
# 			-Winline		\
# 			-pipe			\
# 			-g			\
# LDLIBS += -shared -Wl,-soname,$(NAME_SHARED_MODULE).$(VERSION)
