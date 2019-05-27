function struct = Data(userID)

load userstruct.mat;
UserbyID = find(strcmp({user.UserID},userID)==1);

S = [];

for (i = UserbyID)
    S = [S, user(i)]; 
end

struct = S;

save S;

load S;
end
