function [x,y] = nearest_food(position,foods)

dist = 10000;

[m,~] = size(foods);

for i=1:m
    cond = norm(position(1,:) - foods(i,:));
    if (cond < dist) 
        dist = cond; 
        x = foods(i,1);
        y = foods(i,2);
    end
end

end
