function [x,y,check_f,last_landmark_f,path_length] = search_nest(visibility,dens,global_vector,nest,position,err,check,landmarks,last_landmark)

next_length = visibility/8*rand*dens;

if (check == 0)
    check_f = 0;
else
    check_f = 1;
end

last_landmark_f = last_landmark;

path_length = next_length;

if (is_coordinate_visible(visibility,nest,position) == 1)
    if (is_reachable(nest,position,next_length) == 1)
        x = nest(1);
        y = nest(2);
    else
        alpha_glob = calc_degree(global_vector);
        
        x = next_length * cos(alpha_glob + err) + position(1);
        y = next_length * sin(alpha_glob + err) + position(2);
    end
   
elseif (is_coordinate_visible(visibility,landmarks,position) == 1 && check == 0)
    
    [X,Y,~,~] = nearest_landmark(position,landmarks);
    
    if (is_reachable([X,Y],position,next_length) == 1)
        x = X;
        y = Y;
        
        last_landmark_f = [x,y];
        
        check_f = 1;
    else
        local_vect = [X - position(1),Y - position(2)];
    
        next_degree = calc_degree(local_vect);
    
        x = next_length * cos(next_degree + err) + position(1);
        y = next_length * sin(next_degree + err) + position(2);
    end
else
    if (check == 1)
        [X,Y] = landmark_pointer(landmarks,last_landmark);
        
        if (is_reachable([X,Y],position,next_length) == 1)
            x = X;
            y = Y;
        
            last_landmark_f = [x,y];
        elseif (check_position(position,landmarks) == 1)
            [Xp,Yp] = landmark_pointer(landmarks,position(1,:));
            
            local_vect = [Xp - position(1), Yp - position(2)];
            
            next_degree = calc_degree(local_vect);
        
            x = next_length * cos(next_degree + err) + position(1);
            y = next_length * sin(next_degree + err) + position(2); 
            
            last_landmark_f = position;
        else
            local_vect = [X - position(1), Y - position(2)];
            
            next_degree = calc_degree(local_vect);
        
            x = next_length * cos(next_degree + err) + position(1);
            y = next_length * sin(next_degree + err) + position(2); 
        end
    else
        alpha_glob = calc_degree(global_vector);
        
        x = next_length * cos(alpha_glob + err) + position(1);
        y = next_length * sin(alpha_glob + err) + position(2);
    end
end

end
