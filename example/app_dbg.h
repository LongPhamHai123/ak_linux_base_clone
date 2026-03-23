#ifndef __APP_DBG_H__
#define __APP_DBG_H__

#include <stdio.h>
#include "sys_dbg.h"

#define APP_DBG_EN			1
#define APP_PRINT_EN		1
#define APP_DBG_SIG_EN		1

#if (APP_PRINT_EN == 1)
#define APP_PRINT(fmt, ...)		printf(fmt, ##__VA_ARGS__)
#endif

#endif //