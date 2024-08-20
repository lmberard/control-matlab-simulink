function [xp] = fdexu2(x,u)
    xp=[x(2);sin(x(1))-1.4595*x(1)^3-x(2)+u];
endfunction 
