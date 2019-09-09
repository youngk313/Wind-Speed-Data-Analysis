function [fsmooth, specsmooth] = smoother(Nbin, a, b, f, energspect)
lindex = 1;
hindex = 2;
specsmooth = [];
fbins = logspace(a,b,floor(Nbin*(b-a)));
fsmooth = zeros(1,length(fbins)-1);
fbins(end) = f(end);
for i = 1:length(fbins)-1
    if(f(lindex) < fbins(i))
       lindex = hindex;
       hindex = hindex + 1;
    end
    while(f(hindex)< fbins(i+1))
       hindex = hindex + 1;
    end
    
    specsmooth(i) = mean(energspect(lindex:hindex-1));
    fsmooth(i) = (fbins(i+1)-fbins(i))/(log(fbins(i+1))-log(fbins(i)));
end


end

