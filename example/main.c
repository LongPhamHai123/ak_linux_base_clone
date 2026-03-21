#include "main.h"
#include "raylib.h"
int main() {
	ak_init_tasks(AK_TASK_LIST_LEN, task_list_init);

    ak_start_all_tasks();

    ak_stop_all_tasks();

    // InitWindow(800, 450, "raylib [core] example - basic window");

    // while (!WindowShouldClose())
    // {
    //     BeginDrawing();
    //         ClearBackground(RAYWHITE);
    //         DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
    //     EndDrawing();
    // }

    // CloseWindow();

	return 0;
}
