function bool = is_coordinate_visible(visibility,coordinates,position)

[m,~] = size(coordinates);

bool = 0;

for i = 1:m
    cond = (coordinates(i,1) - position(1))^2 + (coordinates(i,2) - position(2))^2;
    if (cond <= visibility^2)
        bool = 1;
        break;
    end
end

end

