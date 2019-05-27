function struct = getValues(Datestring)

load userstruct.mat;

Datestring;

A = size(user);

i = A(2);

ii = 1;

Userbydate = [];

while ii<=i
    if (find(string(user(ii).DateTime(1)) == Datestring))
        Userbydate = ii;
        break
    else
    ii = ii + 1;
    end  
end

S3 = [];

for (i = Userbydate)
    S3 = [S3, user(i)]; 
end

struct = S3;
save S3;
load S3;
end
