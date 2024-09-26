% Define the locations and their coordinates
places = {'Seattle', 'Michigan', 'Bolivia', 'Topeka', 'Ohio', 'Lake Winnebago'};
latitudes = [47.6062, 44.3148, -16.2902, 39.0558, 40.4173, 44.0720];
longitudes = [-122.3321, -85.6024, -63.5887, -95.6890, -82.9071, -88.4154];

% Define colors for each place
colors = {'red', 'blue', 'green', 'yellow', 'magenta', 'cyan'};

% Create a figure with a geographic axes
figure('Color', 'white')
gx = geoaxes('FontSize',12);

% Set the basemap to 'satellite' for high resolution
gx.Basemap = 'satellite';

% Plot the locations on the map with different colors
hold on
for i = 1:length(places)
    h(i) = geoscatter(latitudes(i), longitudes(i), 100, colors{i}, 'filled', 'DisplayName', places{i});
end
hold off

% Adjust the geographic limits to encompass all points
latlim = [min(latitudes)-10, max(latitudes)+10];
lonlim = [min(longitudes)-10, max(longitudes)+10];
geolimits(gx, latlim, lonlim);

% Add labels to each location (optional)
for i = 1:length(places)
    text(gx, longitudes(i)+0.5, latitudes(i)+0.5, places{i}, ...
        'FontSize', 12, 'Color', 'white', 'FontWeight', 'bold');
end

% Add a legend with brief descriptions
legend(h, places, 'Location', 'bestoutside');

% Add a title to the map
title('Map of Specified Locations with Different Colors', 'FontSize', 16, 'FontWeight', 'bold');
