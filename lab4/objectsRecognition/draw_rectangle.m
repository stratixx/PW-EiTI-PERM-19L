function[rotPoints]= draw_rectangle(center_location,L,H,theta,rgb)
center1=center_location(1);
center2=center_location(2);
R= ([cosd(theta) -sind(theta); sind(theta) cosd(theta)]);
X=([-L/2, L/2, L/2, -L/2]);
Y=([-H/2, -H/2, H/2, H/2]);

points = [-L/2 -H/2; L/2 -H/2; L/2 H/2; -L/2 H/2];

rotPoints = points*R;

rotPoints(:,1) = rotPoints(:,1) + center_location(1);
rotPoints(:,2) = rotPoints(:,2) + center_location(2);

% pos = [x_lower_left y_lower_left; x_lower_right y_lower_right;...
%     x_upper_right y_upper_right; x_upper_left y_upper_left];
%fill(x_coor, y_coor,rgb);
%axis equal;
drawpolygon('Position', rotPoints, 'Color', rgb);
end