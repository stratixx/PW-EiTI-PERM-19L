function [massCenter_] = massCenter( data )

%     figure(1)
% complex to double
massCenter_ = [ abs(data) ];
% unify values
massCenter_ = massCenter_ ./ sum(massCenter_);

rows = length(massCenter_(:,1));
columns = length(massCenter_(1,:));

massCenter_ = massCenter_ .* ((rows:-1:1)' * ones(1, columns));
massCenter_ = sum( massCenter_ );

%     figure(1);
%     plot(center, '.-');

%close all;
end
