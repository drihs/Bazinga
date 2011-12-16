function [x,y,xp,yp] = nearest_landmark(position,landmarks)

dist = 10000;

[m,~] = size(landmarks);

for i=1:m
    cond = norm(position(1,:) - landmarks(i,1:2));
    if (cond < dist) 
        dist = cond; 
        x = landmarks(i,1);
        y = landmarks(i,2);
        xp = landmarks(i,3);
        yp = landmarks(i,4);
    end
end

end
