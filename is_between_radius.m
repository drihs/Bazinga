function bool = is_between_radius(coordinate,center,radius,difference)

bool = 0;

cond = (coordinate(1) - center(1))^2 + (coordinate(2) - center(2))^2;

if (cond <= radius^2 && cond > (radius - difference)^2)
    bool = 1;
end

end
