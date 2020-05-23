function S = CNPS(I,N)
% I: input image 
% N: iteration number
theata0 = 1;               
[m,n] = size(I);
V = zeros(m,n);
V = double(V);
U = zeros(m,n);
U = double(U);
p = zeros(m,n);
w = 20;
T = theata0.*ones(m,n);
S = zeros(m,n);
link_arrange = 3;
center_x=round(link_arrange/2);
center_y=round(link_arrange/2);
W=zeros(link_arrange,link_arrange);
for i=1:link_arrange
    for j=1:link_arrange
        if (i==center_x)&&(j==center_y)
            W(i,j)=0;
        else
            W(i,j)=1./sqrt((i-center_x).^2+(j-center_y).^2); % convolve kernel
        end
    end
end
for t=1:N
    work = conv2(p,W,'same');
    for row=1:m
        for col=1:n
            if p(row,col) == 0
                U(row,col) = U(row,col) + I(row,col) + work(row,col);
                V(row,col) = V(row,col) + work(row,col);
                T(row,col) = T(row,col);
            else
                U(row,col) = I(row,col) + work(row,col); 
                V(row,col) = work(row,col);
                T(row,col) = w * p(row,col); 
            end
        end
    end
    N = U.*(1 + V);
    p = (N >=T);
    p = double(p);
    S = S + p;
end
end
