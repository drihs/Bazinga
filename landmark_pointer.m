function [dX,dY] = landmark_pointer(landmarks,landmark)

[m,~] = size(landmarks);
dX = 0;
dY = 0;

for i = 1:m
   if (landmarks(i,1) == landmark(1) && landmarks(i,2) == landmark(2))
       dX = landmarks(i,3);
       dY = landmarks(i,4);
       break;
   end
end

end
