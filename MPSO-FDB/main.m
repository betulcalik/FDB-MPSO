algorithms = {'MPSO', 'MPSO_FDB_case1'};

dimension = 30; % optimize edilecek problemin boyutu, 30 - 50 - 100
run = 25; % deneysel calismalarin tekrar sayisi
maxFEs = 1000*dimension; % amac fonksiyonu degerlendirme sayisi
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