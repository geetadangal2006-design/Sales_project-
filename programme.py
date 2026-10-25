import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from matplotlib.lines import lineStyles

pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)
df = pd.read_excel('C:/Users/geeta/Downloads/Sample data (1).xlsx')
df.info()
null = df.isnull().sum()
print("NULL values :",null)

# statistics value
sts = df.describe()
print("values:",sts) # found an outlier in profit section which is -40617.50

#filling missing values
df["Discount Band"] = df["Discount Band"].fillna(0)

#handling duplicates
dulp = df.duplicated().sum()
print(" total duplicated values :",dulp)
remove_dulps = df.drop_duplicates(inplace=True)
print(" remove duplicate values :",remove_dulps)


#outlier by graph

plt.figure(figsize=(6,4))
plt.boxplot(df["Profit"],vert=True,patch_artist=True,boxprops=dict(facecolor='lightblue'))
plt.title("Box plot for Profit Outliers")
plt.ylabel("Profit")
plt.grid(True,linestyle ='--',alpha=0.5)
plt.show()

#heavy loss row
print("heavy loss row")
print(df[df['Profit']==df['Profit'].min()])
#heavy profit row
print("heavy profit row")
print(df[df['Profit']==df['Profit'].max()]) #no outlier!! manufacture price was 250 meanwhile the discount was 50% which means a huge loss .

#Duplicate vales:
dup = df.duplicated().sum()
print(dup)

# converting file into csv
df.to_csv("cleaned_sales.csv", index=False)
import os
print(os.getcwd())


