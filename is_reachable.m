function bool = is_reachable(coordinates, position, path_length)

bool = 0;

[m,~]  = size(coordinates);

dist = path_length;

for i = 1:m
   cond = norm(position - coordinates(i,:));
   if (cond <= dist)
       bool = 1;
       break;
   end
end

end
