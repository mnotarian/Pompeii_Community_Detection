# Pompeii Community Detection
Code and Data associated with 
>**Notarian, M. "Social Network Analysis, Community Detection Algorithms, and Neighbourhood Identification in Pompeii." (CAA Oxford 2022)**

# Using This Data
This repository contains a number of files that can be used to reproduce the analysis or merely explore the data in more detail than presented in the article. An explanation of each is found below.

- **Pompeii_Community_Detection_CHAMP.ipynb**: A Jupyter Notebook file that contains the Python code used to generate the analysis discussed in the paper. It explains how to install the customized version of CHAMP on your system, and then runs through the steps on each network. The original outputs are visible in each cell. This can be downloaded, opened in a Jupyter Notebook, and reproduced by loading the graphml files in this repository. However, please note, due to the stochastic nature of community detection algorithms, including CHAMP, it is possible that your results may differ slightly from those here.

- **Belonging Degree.R**: An ```.R``` script with the code and instructions used to generate each node's degree of belonging as discussed in the article. 

This repository contains three ```.graphml``` files with the raw network data used in the article. These were exported with Gephi and can be opened there or with another suitable network program:
- **closest_network.graphml**
- **thirty_second_network.graphml**
- **one_minute_network.graphml**

A series of ```.csv``` files that contain the entire output of community partitions from each run of CHAMP:

- **Closest by door Leiden 1000 runs gamma1-7.csv**
- **Closest by door Leiden 5000 runs gamma1-7.csv**
- **30 second Leiden 1000 runs gamma1-5.5 leiden2.csv**
- **30 second Leiden 5000 runs gamma1-5.5 leiden2.csv**
- **One Minute Leiden 1000 runs gamma1-4.5.csv**
- **One Minute Leiden 5000 runs gamma1-4.5.csv**

Finally, for each network, the two top partitions discussed in the article are included as ```.gexf``` files:

- **closestbydoor_network_communities.gexf**
- **thirty_second_network_communities.gexf**
- **one_minute_network_communities.gexf**

These networks can also be visualized interactively online at the links below:
-  [Closest by Door Network CHAMP Communities](https://mnotarian.github.io/Pompeii_ClosestbyDoorNetwork/)
-  [30 Second Network CHAMP Communities](https://mnotarian.github.io/Pompeii_30SecondNetwork/)
-  [One Minute Network CHAMP Communities](https://mnotarian.github.io/Pompeii_OneMinuteNetwork/)
