sides = 0;
for(i = 0; i < 4; i++)
{
   /*if((argument1.corner[1,1] - argument1.corner[0, 1])/
   (argument1.corner[1, 0] - argument1.corner[0, 0])*
   (argument0.x + argument2 - argument1.corner[0, 0]) + argument1.corner[0, 1] 
   <= (argument0.y + argument3 + argument0.radius + 1))
   {
        return 1;
   }*/
   Ux = argument1.corner[(i + 1) mod 4,0] - argument1.corner[i mod 4, 0];
   Uy = argument1.corner[(i + 1) mod 4,1] - argument1.corner[i mod 4, 1];
   Vx = argument0.x + argument2 - argument1.corner[i mod 4, 0];
   Vy = argument0.y + argument3 - argument1.corner[i mod 4, 1];
   Umag = sqrt(Ux*Ux + Uy*Uy);
   Vmag = sqrt(Vx*Vx + Vy*Vy);
   projUVx = (Ux*Vx + Uy*Vy)/(Ux*Ux + Uy*Uy)*Ux;
   projUVy = (Ux*Vx + Uy*Vy)/(Ux*Ux + Uy*Uy)*Uy;
   rad = sqrt(ProjUVx*projUVx + projUVy*projUVy);
   crossUV = Ux*Vy - Vx*Uy;
   if(rad < argument0.radius && crossUV > 0)
   {
        sides++;
   }      
}
return sides
