function [x, y] = update_glob_vect(prev_vect, new_vect)

x = prev_vect(1,1) + new_vect(1,1);
y = prev_vect(1,2) + new_vect(1,2);

end
