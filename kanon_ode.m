function y_ut = kanon_ode(t, y, g, w, c, air_res)
    v_r = sqrt((y(3) - w)^2 + y(4)^2);
    
    x_t = y(3);
    y_t = y(4);
    
    vx_t = -c*v_r*(y(3) - w);
    vy_t = -g-c*v_r*y(4);
    
    if air_res == 0
        vx_t = 0;
        vy_t = -g;
    end
    
    y_ut = [x_t;
            y_t;
            vx_t;
            vy_t];
end