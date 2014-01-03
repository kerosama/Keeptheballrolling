sides = 0;
if(argument4 == false)
{
   slopex = 0;
   slopey = 0;
   slopemag = 0; 
}
for(i = 0; i < 4; i++)
{
   Ux = argument1.corner[(i + 1) mod 4,0] - argument1.corner[i mod 4, 0];
   Uy = argument1.corner[(i + 1) mod 4,1] - argument1.corner[i mod 4, 1];
   Vx = x + argument2 - argument1.corner[i mod 4, 0];
   Vy = y + argument3 - argument1.corner[i mod 4, 1];
   Umag = sqrt(Ux*Ux + Uy*Uy);
   Vmag = sqrt(Vx*Vx + Vy*Vy);
   projUVx = (Ux*Vx + Uy*Vy)/(Umag*Umag)*Ux;
   projUVy = (Ux*Vx + Uy*Vy)/(Ux*Ux + Uy*Uy)*Uy;
   radx = Vx - projUVx;
   rady = Vy - projUVy;
   rad = sqrt(radx*radx + rady*rady);
   crossUV = Ux*Vy - Vx*Uy;
   angleUV = arccos((Ux*Vx + Uy*Vy)/(Umag*Vmag))*180/pi;   
   if(crossUV > 0)
   {
        angleUV = 360 - angleUV;
   }
   Wx = argument1.corner[(i + 3) mod 4, 0] - argument1.corner[i mod 4,0];
   Wy = argument1.corner[(i + 3) mod 4, 1] - argument1.corner[i mod 4,1]; 
   Wmag = sqrt(Wx*Wx + Wy*Wy);
   angleUW = arccos((Ux*Wx + Uy*Wy)/(Umag*Wmag))*180/pi;
   if((rad <= argument0.radius || crossUV > 0)
   && !(angleUV >= 90 && angleUV <= (270 - angleUW) && Vmag >= argument0.radius))
   {
        sides++;        
   }
   else if(argument4 == true)
   {
        slopex = Ux;
            slopey = Uy;
            slopemag = sqrt(Ux*Ux + Uy*Uy);
            x = argument1.corner[i mod 4, 0] + projUVx + radx*(argument0.radius + .1)/rad; 
            y = argument1.corner[i mod 4, 1] + projUVy + rady*(argument0.radius + .1)/rad;
            if(slopemag != 0)
        {
            speedot = hspeed*slopex + vspeed*slopey;
            tempspeed = speed;            
            
            temph = speedot*tempspeed*slopex/slopemag;
            tempv = speedot*tempspeed*slopey/slopemag;
            
            //hspeed = speedot*tempspeed*slopex/slopemag;
            //vspeed = speedot*tempspeed*slopey/slopemag;
            if(speedot != 0)
            {
                temph = temph/abs(speedot);
                tempv = tempv/abs(speedot);
            }
            h += temph;
            v += tempv;
        }
           if(rady < 0)
            canjump = 2;
            
            
           //else
           // canjump = 0;
         
   }  
     
}

 
return sides;
