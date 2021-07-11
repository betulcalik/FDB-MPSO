clear;
clc;
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
% algorithms = {'sfs_case2', 'abc', 'aefa', 'aeo', 'agde', 'aso', 'boa', 'bsa', 'cgsa', 'ckgsa', 'coa', 'cs', 'csa', 'de', 'dsa', 'ebocmar', 'efo', 'gsa', 'gwo', 'hho', 'is', 'lsa', 'lshade', 'lshade_cnepsin', 'lshade_spacma', 'mfla', 'mfo', 'mrfo', 'ms', 'pso', 'sca', 'se', 'sfs', 'sdo', 'sos', 'ssa', 'tlabc', 'wde', 'woa', 'yypo'};
algorithmsNumber = length(algorithms); functionsNumber = 10; experimentNumber = 1; 
experimentsName = {'Cec2020', 'Mean'};
filename = 'all.xlsx'; run = 25;
solution = zeros(algorithmsNumber * experimentNumber, functionsNumber, run);
solutionR = zeros(algorithmsNumber, functionsNumber * experimentNumber, run);
friedmanR = zeros(functionsNumber * experimentNumber, algorithmsNumber);
result = zeros(functionsNumber  * algorithmsNumber, 6 * experimentNumber);
firstWilcon = zeros(1, run);
secondWilcon = zeros(1, run);
sumWilcon = zeros(algorithmsNumber*experimentNumber, 3);

for i = 1 : algorithmsNumber
    solutionR(i,:,:) = xlsread(filename, char(algorithms(i)));
    solutionR(i,6,:) = zeros(1, run);
end

for i = 1 : functionsNumber
    for j = 1 : run
        for k = 1 : algorithmsNumber * experimentNumber
            m = mod(k, algorithmsNumber); if(m == 0), m = algorithmsNumber; end
            n = (i - 1) * experimentNumber + ceil(k / algorithmsNumber);
            solution(k, i, j) = solutionR(m, n, j);
        end
    end
end

for i = 1 : functionsNumber
    for k=1:experimentNumber
        for m=1:algorithmsNumber
            result(algorithmsNumber*(i-1)+m,6*k-5) = min(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-4) = mean(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-3) = std(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-2) = median(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-1) = max(solution(algorithmsNumber*(k-1)+m,i,:));
        end
        for m=1:algorithmsNumber-1
            for n=1:run
                firstWilcon(n) = solution(algorithmsNumber*(k-1)+1,i,n);
                secondWilcon(n) = solution(algorithmsNumber*(k-1)+m+1,i,n);
            end
            [p,h, stats] = ranksum(firstWilcon, secondWilcon);
            wilcon = 0;
            if(h)
                if(p < 0.05)
                    if(stats.zval < 0)
                        wilcon = 2; % firstWilcon daha iyi
                    else
                        wilcon = 1; % secondWilcon daha iyi
                    end  
                end
            end
            result(algorithmsNumber*(i-1)+m+1,6*k) = wilcon;
        end
    end
end

for i=1:experimentNumber
    for j=1:algorithmsNumber
        pW = 0; eW = 0; nW = 0;
        for k=1:functionsNumber
            vW = result(algorithmsNumber * (k - 1) + j, 6 * i);
            if(vW == 0)
                eW = eW + 1;
            elseif(vW == 1)
                pW = pW + 1;
            else
                nW = nW + 1;
            end         
        end
        sumWilcon(algorithmsNumber * (i - 1) + j, 1) = pW;
        sumWilcon(algorithmsNumber * (i - 1) + j, 2) = eW;
        sumWilcon(algorithmsNumber * (i - 1) + j, 3) = nW;
    end
end

for i = 1 : functionsNumber
    for k=1:experimentNumber
        compareResult = zeros(run, algorithmsNumber);
        for m=1:algorithmsNumber
            compareResult(:, m) = solution(algorithmsNumber*(k-1)+m,i,:);
        end
        [~,~,stats] = friedman(compareResult, 1, 'off');
        friedmanR((k - 1) * functionsNumber + i, :) = stats.meanranks;
    end
end

fridmanRes = zeros(experimentNumber, functionsNumber + 1, algorithmsNumber);
for i = 1 : functionsNumber
    for j = 1 : experimentNumber
        fridmanRes(j, i, :) = friedmanR(functionsNumber * (j - 1) + i, :);
    end
end
for i = 1 : algorithmsNumber
    for j = 1 : experimentNumber
        fridmanRes(j, functionsNumber + 1, i) = mean(fridmanRes(j, 1 : functionsNumber, i));
    end
end

fridmanResult = []; wStatistic = []; fStatistic = []; wStatisticS = {};
for i = 1 : experimentNumber
    fridmanResult = [fridmanResult, squeeze(fridmanRes(i,:,:))];
    wStatistic = [wStatistic, sumWilcon((i-1)*algorithmsNumber+1:i*algorithmsNumber,:)];
    fStatistic = [fStatistic; fridmanRes(i,functionsNumber+1,:)];
    for j = 1 : algorithmsNumber
        wStatisticS(j, i) = cellstr(strcat(int2str(wStatistic(j, 3 * (i - 1) + 1)), '_', int2str(wStatistic(j, 3 * (i - 1) + 2)), '_', int2str(wStatistic(j, 3 * i))));
    end
end

fStatistic = squeeze(fStatistic);
fSortIndex = 1;
if(experimentNumber == 1)
    fStatistic = fStatistic';
else
    fSortIndex = fSortIndex + experimentNumber;
    fStatistic = [fStatistic; mean(fStatistic)];
end
algoritmNames = upper(algorithms);
[~,fI] = sort(fStatistic(fSortIndex,:));
sortedAlgorithm = algoritmNames(fI);

xlswrite(filename, result, 'Wilcoxon');
xlswrite(filename, fridmanResult, 'Friedman');
xlswrite(filename, algoritmNames', 'Wstatistic', 'A2');
xlswrite(filename, experimentsName(1:experimentNumber), 'Wstatistic', 'B1');
xlswrite(filename, wStatisticS, 'Wstatistic', 'B2');
xlswrite(filename, algoritmNames, 'Fstatistic', 'B1');
xlswrite(filename, experimentsName', 'Fstatistic', 'A2');
xlswrite(filename, sortedAlgorithm, 'Fstatistic', 'B7');
xlswrite(filename, fStatistic, 'Fstatistic', 'B2');
disp('End :)');