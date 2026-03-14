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



int main()
{
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "Simple 2D Game");

    // Player
    Rectangle player = {100, 200, 40, 40};
    float speed = 5;

    // Enemy
    Rectangle enemy = {600, 200, 40, 40};
    float enemySpeed = 3;

    SetTargetFPS(60);

    while (!WindowShouldClose())
    {
        // Player movement
        if (IsKeyDown(KEY_RIGHT)) player.x += speed;
        if (IsKeyDown(KEY_LEFT))  player.x -= speed;
        if (IsKeyDown(KEY_UP))    player.y -= speed;
        if (IsKeyDown(KEY_DOWN))  player.y += speed;

        // Enemy movement
        enemy.x -= enemySpeed;

        if (enemy.x < 0)
            enemy.x = screenWidth;

        // Collision
        bool collision = CheckCollisionRecs(player, enemy);

        BeginDrawing();
        ClearBackground(RAYWHITE);

        DrawRectangleRec(player, BLUE);
        DrawRectangleRec(enemy, RED);

        if (collision)
        {
            DrawText("GAME OVER", 320, 200, 30, BLACK);
        }

        DrawText("Move: Arrow Keys", 10, 10, 20, DARKGRAY);

        EndDrawing();
    }

    CloseWindow();

    return 0;
}