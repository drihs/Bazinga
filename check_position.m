function bool = check_position(position, to_check)

bool = 0;

[m,~] = size(to_check);

for i = 1:m
   if (position(1,:) == to_check(i,1:2))
      bool = 1;
      break;
   end
end

end
