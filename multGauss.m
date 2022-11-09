
function X = multGauss(M,x)

if length(fieldnames(M))  < 3
    
  disp("Input Matrix has less than 3 columns")
  Z = 'err';
    
else
    
    for i=1:length(M.sig)
    Z(i,:)=gaussmf(x,[M.sig(1,i) M.vo(1,i)]);
    
    Z(i,:) = Z(i,:).*M.amp(1,i);
    end

end

% Now compute the sum

X = sum(Z,1);
        
end
