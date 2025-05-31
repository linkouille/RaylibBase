#include <math.h>
#include <stdio.h>

#include "raylib.h"

int main(int argc, char const *argv[])
{
  printf("Hello World!\n");

  InitWindow(800, 450, "RaylibBase");

  Color bgColor = {45,60,80,255};

  float blinkTimer = 0.0f;
  float blinkColdown = 0.5f;
  bool blinkState = true;

  while (!WindowShouldClose())
  {
    BeginDrawing();

    ClearBackground(bgColor);
            
    DrawText("Hello world !", 190, 100, 20, LIGHTGRAY);
        
    DrawRectangle(190, 140, 13*20, 20, LIGHTGRAY); 

    DrawRectangleLines(190, 180, 13*20, 20, LIGHTGRAY); 

    DrawRectangleGradientH(190, 220, 13*20, 20, LIGHTGRAY, bgColor);
     
    if(blinkState){
      DrawCircle(190 + 20, 280, 20, LIGHTGRAY);
    }

    DrawRectangleLines(500, 100, 200, 200, LIGHTGRAY); 
    
    float time = GetTime();


    for (float i = 0; i < 100; i++) {
      Color color = { 20, 20, (i/20.0f) * 255, 255};
       
      Color cH = ColorLerp(RED, GREEN, (sinf(time + (i * 0.5f)) * 80) / 200);
      
      Color cV = ColorLerp(cH, BLUE, (cosf(time + (i * 0.1f)) * 80) / 200);

      DrawCircle(
        600 + sinf(time + (i * 0.5f)) * 80,  
        200 + cosf(time + (i * 0.1f)) * 80,
        10, 
        cV); 
    }

    EndDrawing();

    blinkTimer += GetFrameTime();
    if(blinkTimer > blinkColdown)
    {
      blinkTimer = 0;
      blinkState = !blinkState;
    }
  }

  CloseWindow();

  return 0;
}
