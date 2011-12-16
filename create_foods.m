function foods = create_foods(size, number_foods, nest, visibility)

range_foods = [-size + 1, size - 1];

foods = zeros(number_foods,2);

j = 1;
while (j <= number_foods)
    fd = [randi(range_foods),randi(range_foods)];
    if (is_in_circle(fd,nest,2*visibility) == 0)
        foods(j,:) = fd(1,:);
        j = j + 1;
    end
end

end
