exec('init.sci');

function writeDataToFile(filename, variables, delimiter)

    data = [];
    labels = '';
    n_var = size(variables, 1)
    for i = 1:n_var
        data(:,i) = variables{i,1};
        labels = labels + variables{i,2};
        if i ~= n_var
            labels = labels + delimiter;
        end
    end

    csvWrite(data, filename, delimiter, '.', [], labels);

endfunction

variables = {
    time.values, 'time';
    y_no_ctrl.values, 'y(no control)';
    y_ctrl.values, 'y(control)';
    y_ref.values, 'y(ref)';
    u.values, 'u';
};

writeDataToFile('result.csv', variables, ',');
