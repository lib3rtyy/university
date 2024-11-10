fis = readfis('MAMDANI.fis');

% Set up the plot
figure;
grid on;
xlim([0, 16]);
ylim([0, 10]);
xlabel('X-axis')
ylabel('Y-axis')
title('Car Control')

hold on;
line([10 10], [0 5], 'color', 'black');
line([10 11], [5 5], 'color', 'black');
line([11 11], [0 6], 'color', 'black');
line([11 12], [6 6], 'color', 'black');
line([12 12], [0 7], 'color', 'black');
line([12 16], [7 7], 'color', 'black');

robot = scatter(9.1, 4.3, 'bl', 'filled');
goal = scatter(15, 7.2, 'g', 'filled');

% Set the initial state of the robot
x = 9.1;
y = 4.3;
theta = 0 * (pi/180); %change value of 0 for 45 and 90 

% Set the goal position
goal_x = 15;
goal_y = 7.2;

% Set the step size and number of iterations
step_size = 0.1;
num_iterations = 200;

% Initialize the list of coordinates
coords = [x, y];

for i = 1:num_iterations
    % Calculate the distances to the walls
    dv = y;
    dh = x;

    % Evaluate the FIS to get the change in theta
    delta_theta = evalfis([dv, dh, theta], fis);

    % Update the robot's orientation
    theta = theta + delta_theta;

    % Update the robot's position
    x = x + step_size * cos(theta);
    y = y + step_size * sin(theta);

    % Debug print statements
    fprintf('Iteration %d:\n', i);
    fprintf('Robot position: x = %f, y = %f, theta = %f, delta_theta = %f\n', dh, dv, theta, delta_theta);

    % Update the robot's position on the plot
    set(robot, 'XData', x, 'YData', y);

    % Add the robot's position to the list of coordinates
    coords = [coords; x, y];
    
    % Plot a line connecting all the coordinates in the list
    plot(coords(:,1), coords(:,2), 'bl');

    % Check if the robot has reached the goal
    if (x >= 15 && y > 7.2) || x >= 15 
        break;
    end
    
    % Pause for a short time to show the robot's movement
    pause(0.1);
end
