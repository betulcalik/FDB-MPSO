algorithms = {'MPSO', 'FDB_MPSO_case1', 'FDB_MPSO_case2', 'FDB_MPSO_case3', 'FDB_MPSO_case4', 'FDB_MPSO_case5', 'FDB_MPSO_case6', 'FDB_MPSO_case7', 'FDB_MPSO_case8', 'FDB_MPSO_case9', 'FDB_MPSO_case10', ...
              'FDB_MPSO_case11', 'FDB_MPSO_case12', 'FDB_MPSO_case13', 'FDB_MPSO_case14', 'FDB_MPSO_case15', 'FDB_MPSO_case16', 'FDB_MPSO_case17', 'FDB_MPSO_case18', 'FDB_MPSO_case19', 'FDB_MPSO_case20', ...
              'FDB_MPSO_case21', 'FDB_MPSO_case22', 'FDB_MPSO_case23', 'FDB_MPSO_case24', 'FDB_MPSO_case25', 'FDB_MPSO_case26', 'FDB_MPSO_case27', 'FDB_MPSO_case28', 'FDB_MPSO_case29', 'FDB_MPSO_case30', ...
              'FDB_MPSO_case31', 'FDB_MPSO_case32', 'FDB_MPSO_case33', 'FDB_MPSO_case34', 'FDB_MPSO_case35', 'FDB_MPSO_case36', 'FDB_MPSO_case37', 'FDB_MPSO_case38', 'FDB_MPSO_case39', 'FDB_MPSO_case40', ...
              'FDB_MPSO_case41', 'FDB_MPSO_case42', 'FDB_MPSO_case43', 'FDB_MPSO_case44', 'FDB_MPSO_case45', 'FDB_MPSO_case46', 'FDB_MPSO_case47', 'FDB_MPSO_case48', 'FDB_MPSO_case49', 'FDB_MPSO_case50', ...
              'FDB_MPSO_case51', 'FDB_MPSO_case52', 'FDB_MPSO_case53', 'FDB_MPSO_case54', 'FDB_MPSO_case55', 'FDB_MPSO_case56', 'FDB_MPSO_case57', 'FDB_MPSO_case58', 'FDB_MPSO_case59', 'FDB_MPSO_case60', ...
              'FDB_MPSO_case61', 'FDB_MPSO_case62', 'FDB_MPSO_case63', 'FDB_MPSO_case64', 'FDB_MPSO_case65', 'FDB_MPSO_case66', 'FDB_MPSO_case67', 'FDB_MPSO_case68', 'FDB_MPSO_case69', 'FDB_MPSO_case70', ...
              'FDB_MPSO_case71', 'FDB_MPSO_case72', 'FDB_MPSO_case73', 'FDB_MPSO_case74', 'FDB_MPSO_case75', 'FDB_MPSO_case76', 'FDB_MPSO_case77', 'FDB_MPSO_case78', 'FDB_MPSO_case79', 'FDB_MPSO_case80', ...
              'FDB_MPSO_case81', 'FDB_MPSO_case82', 'FDB_MPSO_case83', 'FDB_MPSO_case84', 'FDB_MPSO_case85', 'FDB_MPSO_case86', 'FDB_MPSO_case87', 'FDB_MPSO_case88', 'FDB_MPSO_case89', 'FDB_MPSO_case90', ...
              'FDB_MPSO_case91', 'FDB_MPSO_case92', 'FDB_MPSO_case93', 'FDB_MPSO_case94', 'FDB_MPSO_case95', 'FDB_MPSO_case96', 'FDB_MPSO_case97', 'FDB_MPSO_case98'};

dimension = 30; % the size of the problem to be sized, 30 - 50 - 100
run = 25; % number of repetitions of experimental
maxFEs = 10000*dimension; % amac fonksiyonu degerlendirme sayisi
filename = 'result';
functionsNumber = 10; % benchmark'taki problem sayisi
solution = zeros(functionsNumber, run);
globalMins = [100, 1100, 700, 1900, 1700, 1600, 2100, 2200, 2400, 2500];
paths;
cec20so = str2func('cec20_func_so'); 
for ii = 1 : length(algorithms)
    disp(algorithms(ii));
    algorithm = str2func(char(algorithms(ii)));
    for i = 1 : functionsNumber
        disp(i);
        for j = 1 : run
           [bestSolution, bestFitness, iteration] = algorithm(cec20so, dimension, maxFEs, i);
            solution(i, j) = bestFitness - globalMins(i);
   
        end
    end
    xlswrite(strcat(filename, '-d=', num2str(dimension), '.xlsx'), solution, func2str(algorithm));
    eD = strcat(func2str(algorithm), '-End :)');
    disp(eD);
end