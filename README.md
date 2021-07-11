<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/betulcalik/FDB-MPSO">
    <img src="https://github.com/betulcalik/FDB-MPSO/blob/main/images/logo.png" alt="Logo" width="130" height="100">
  </a>

  <h1 align="center"> FDB-MPSO </h1>

  <p align="center">
    This repository contains <strong>Modified Particle Swarm Optimization (MPSO)</strong> algorithm integration with <strong>Fitness Distance Balance (FDB)</strong> method. Aim is improvement MPSO algorithm.
    <br />
    <a href="https://github.com/betulcalik/FDB-MPSO"><strong>Explore the project »</strong></a>
    <br />
    <br />
    <a href="https://github.com/betulcalik/FDB-MPSO/issues">Report Bug</a>
  </p>
</p>

---
<!-- Article and code links -->

### Links

<a href="https://www.sciencedirect.com/science/article/abs/pii/S0957417420301780?via%3Dihub"><strong>Explore the article of MPSO algorithm using adaptive strategy »</strong></a>

<a href="https://github.com/lhustl/MPSO"><strong>Explore the MPSO algorithm MATLAB code »</strong></a>

<a href="https://www.sciencedirect.com/science/article/abs/pii/S0950705119305167"><strong>Explore the article of FDB method »</strong></a>

<a href="https://www.mathworks.com/matlabcentral/fileexchange/72311-fdb-sos"><strong>Explore the FDB method MATLAB code »</strong></a>

---

<!-- Turkish article -->
<p><strong>MPSO-FDB algoritmasına ait Türkçe Makale:
<a href="https://github.com/betulcalik/FDB-MPSO/blob/main/reports/MPSO-FDB.pdf">MPSO-FDB</a></strong></p>

---

<!-- Table Of Contents -->

## Table Of Contents

### 1. MPSO Algorithm

<p style="text-align: justify">In expert systems, complex optimization problems are usually nonlinear, nonconvex, multimodal and discontinuous. As an efficient and simple optimization algorithm, particle swarm optimization(PSO) has been widely applied to solve various real optimization problems in expert systems. However, avoiding premature convergence and balancing the global exploration and local exploitation capabilities of the PSO remains an open issue. To overcome these drawbacks and strengthen the ability of PSO in solving complex optimization problems, a modified PSO using adaptive strategy called MPSO is proposed. In MPSO, in order to well balance the global exploration and local exploitation capabilities of the PSO, a chaos-based non-linear inertia weight is proposed. Meanwhile, to avoid the premature convergence, stochastic and mainstream learning strategies are adopted. </p>

<p>In MPSO, the four major highlights are described below.</p>
<ol>
    <li> Chaotic-Based Inertia Weight </li>
    <li> Stochastic and Mainstream Learning Strategies </li>
    <li> Adaptive Position Updating Strategy </li>
    <li> Terminal Replacement Mechanism </li>
</ol>

<p style="text-align: justify">To verify MPSO’s convergence performance on various optimization
problems, comparison experiments on complex CEC2017 are carried out. The experiment results
and corresponding statistical analysis indicate that MPSO outperforms quite a few state-of-the-art
PSO variants and some other evolutionary algorithms proposed recently.</p>

### 2. FDB Method

<p style="text-align: justify">Selection methods have an important role in the meta-heuristic search (MHS) process. However, apart from a few successful methods developed in the past, new and effective studies have not been found in recent years. It is known that solution candidates selecting from the population during the search process directly affects the direction and success of the search. In this study, a new selection method based on fitness-distance balance (FDB) is developed in order to solve the premature convergence problem in the MHS process. Thanks to the developed method, solution candidates with the highest potential to improve the search process can be determined effectively and consistently from the population. </p>

### 3. FDB-MPSO

<p style="text-align: justify">The following procedures were followed in order to carry out the experimental work in an objective and fair manner:

<ol>
  <li>The conditions defined at the <b>CEC 2020 conference</b> are referenced for the experimental work settings.</li>
  <li>In setting the parameters of the MPSO algorithm, the settings given in its own work, ie population size and other settings, were taken as reference.</li>
  <li>In order to ensure equality of opportunity between the algorithms, the termination criterion is defined over the maximum number of evaluations of the objective function. This value is <b>10,000*d (d:problem size).</b></li>
  <li>Experimental work was performed on MATLAB®R2016b, AMD Ryzen 7 4800H, 2.90GHz and 16GB RAM and x64-based processor.</li>
</ol>

</p>

<p style="text-align: justify">Experimental results are available in the <a href="https://github.com/betulcalik/FDB-MPSO/blob/main/MPSO-FDB/all.xlsx"> all.xlsx </a> file. And the results for 30 dimensions are available in the <a href="https://github.com/betulcalik/FDB-MPSO/blob/main/MPSO-FDB/result-d%3D30.xlsx"> result-d=30.xlsx </a> file.</p>

<p>Wilcoxon Statistic Results: (Only good results, for all results please check all.xlsx file)</p>

| Algorithm Name  | CEC 2020 |
| ------------- | ------------- |
| MPSO  | 0_10_0  |
| FDB_MPSO_case11  | 1_9_0 |
| FDB_MPSO_case18  | 1_9_0 |
| FDB_MPSO_case29  | 1_8_1 |

