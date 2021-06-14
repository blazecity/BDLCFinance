# BDLC Finance analysis
This repo contains the code I wrote for the Big Data Lab Cluster (BDLC) module at Lucerne University for Applied Sciences and Arts. I had to choose a 
topic and a corresponding dataset, then analyze the data based on some research questions. 

As the title implies, finance was my topic. I chose it, because I work for a bank and I like the dynamics of financial markets. To be precise, I got the price 
and volume data from around 400 companies via the [yfinance](https://github.com/ranaroussi/yfinance) API. 

Our lecturer provided an environment with a Hadoop cluster. Since I received the data via API, I decided to setup an ETL process. Initally, I loaded the whole 
price history of each stock into the cluster and then load the daily data with a cron job.

The analysis itself had to be done in Zeppelin Notebooks.
