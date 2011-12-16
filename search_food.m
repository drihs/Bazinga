function [x,y,degree_f,path_length] = search_foods(position, degree, dens, visibility, err, size, foods)

next_length = visibility/8*rand*dens;

path_length = next_length;

if (is_coordinate_visible(visibility,foods,position(1,:)) == 1)
    [X,Y] = nearest_food(position,foods);
    
    if (is_reachable([X,Y], position(1,:), next_length) == 1)
        x = X;
        y = Y;
        degree_f = degree;
    else
        new_vec = [X,Y] - position(1,:);
        degree_f = calc_degree(new_vec);
        
        x = next_length * cos(degree_f + err) + position(1);
        y = next_length * sin(degree_f + err) + position(2);
        if (y < -size || y > size || x < -size || x > size)
            for i = 1:3
                x = next_length * cos(degree_f + (pi/2)*i + err) + position(1);
                y = next_length * sin(degree_f + (pi/2)*i + err) + position(2);
                if (x >= -size && x <= size && y >= -size && y <= size)
                    break;
                end
            end
        end
    end
else
    alpha = (-pi/4 + degree):0.1:(pi/4 + degree);

    n = length(alpha);
    degree_f = alpha(randi([1,n]));
    
    x = next_length * cos(degree_f + err) + position(1);
    y = next_length * sin(degree_f + err) + position(2);
    if (y < -size || y > size || x < -size || x > size)
        for i = 1:3
        	x = next_length * cos(degree_f + (pi/2)*i + err) + position(1);
        	y = next_length * sin(degree_f + (pi/2)*i + err) + position(2);
            if (x >= -size && x <= size && y >= -size && y <= size)
                break;
            end
        end
    end
end

end
