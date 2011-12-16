function pointer_matrix = landmark_matrix(landmarks,radius,nest)

[m,~] = size(landmarks);

difference = 2;

pointer_matrix = zeros(radius, m + 1);
pointer_matrix(1,1) = 1;

i = 2;
while (i <= 2*radius + 2)
    for j = 2:m+1
        if (is_between_radius(landmarks(j-1,:), nest(1,:), i,difference) == 1)
            pointer_matrix(i,j) = 1;
        end
    end
    i = i + 2;
end

end
