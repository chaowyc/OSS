function [ MSE,SSE,R_square ] = GetMSESSE( mt,fity,meanmt )
    fity=fity';
    MSE=norm(mt-fity)^2/length(mt);
    SSE=norm(mt-fity)^2;
    tmp=meanmt;
    mean_dmt=zeros(length(mt),1);
    for i=1:length(mt)
        mean_dmt(i,1)=tmp;
    end
    SSR=norm(fity-mean_dmt)^2;
    SST=norm(mt-mean_dmt)^2;
    R_square=SSR/SST;
end

