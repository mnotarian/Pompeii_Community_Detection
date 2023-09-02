# Pompeii_Community_Detection
Code and Data associated with Notarian: Social Network Analysis, Community Detection Algorithms, and Neighbourhood Identification in Pompeii

# Using this data
This repository contains three graphml files with the network data used in the article. These were exported with Gephi and can be opened there or with another suitable network program.

A Jupyter Notebook file (Pompeii_Community_Detection_CHAMP.ipynb) contains the Python code used to generate the analysis discussed in the paper. It explains how to install the customized version of CHAMP on your computer, and then runs through the steps on each network. The original outputs are visible in each cell. This can be downloaded, opened in a Jupyter Notebook, and reproduced by loading the graphml files in this repository, but please note, due to the stochastic nature of community detection algorithms, including CHAMP, it is possible that your results may differ slightly from those here.

The R script "Belonging Degree" contains the code and instructions used to generate each node's degree of belonging as discussed in the article. 
