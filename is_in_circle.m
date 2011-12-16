function bool = is_in_circle(coordinate,center,radius)

bool = 0;

cond = (coordinate(1) - center(1))^2 + (coordinate(2) - center(2))^2;

if (cond <= radius^2)
    bool = 1;
end

end
